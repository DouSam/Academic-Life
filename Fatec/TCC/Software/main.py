# IMPLEMENTACAO NO COLAB: https://colab.research.google.com/drive/1A5P4A97RbhopZt5y-oEwl6dujr-IuVEV?usp=sharing


import pydicom
import matplotlib.pyplot as plt
import pandas as pd  
import cv2
import numpy as np
np.set_printoptions(threshold=1000000)
import math
from skimage.segmentation import watershed, find_boundaries ,flood, flood_fill, random_walker
from skimage.morphology import binary_closing, remove_small_objects
from skimage.filters import sobel
from skimage.feature import canny
from skimage.util import img_as_ubyte
from skimage.measure import label, regionprops_table
from scipy import ndimage as ndi
from IPython.display import display

# IMPLEMENTACAO

# Funcoes para transformacao da imagem dicom

  # Recebe a imagem e os dados médicos e retorna em escala correta
def transform_to_hu(medical_image, image): 
    intercept = medical_image.RescaleIntercept
    slope = medical_image.RescaleSlope
    hu_image = image * slope + intercept

    return hu_image
  # Realiza a centralizacao em certa faixa de valores
  # Similar ao processo de threshold
def window_image(image, window_center, window_width):
    img_min = window_center - window_width // 2
    img_max = window_center + window_width // 2
    window_image = image.copy()
    window_image[window_image < img_min] = img_min
    window_image[window_image > img_max] = img_max

    return window_image

# Funcoes para pre processamento

  # Obtem o negativo da imagem com escala 0-255
def negativeImg(image):
    # Formula s = L - 1 - r

    negative_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            negative_img[i, j] = 256 - 1 - image[i, j]

    return negative_img

  # Aplica um filtro logaritmico a todos os pixels com o valor c
def logImg(image, c):
    # Formula s = c * log(1 + r)

    log_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            log_img[i, j] = c * math.log(1 + image[i, j])

    return log_img

  # Correcao simples de gamma
def gammaCorretion(image, c, y):
    # Formula s = c * r ^ y

    gamma_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            gamma_img[i, j] = c * image[i, j] ** y

    return gamma_img

  # Correcao de contraste com base em valor minimo e maximo
def minMaxContrast(image, min=55, max=255):
    # Formula s = (r - xmin) / (xmax - xmin)

    min_max_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            min_max_img[i, j] = ((image[i, j] - min) / (max - min)) * 255
            # Talvez variar ainda mais o minimo e o máximo, caminhando de 10 em 10

    return min_max_img
  
  # Aplica filtro de caixa
def boxFilter(image):
    return cv2.boxFilter(image, -1, (5, 5))

  # Aplica filtro da mediana
def medianFilter(image):
    return cv2.medianBlur(image, 5)

  # Aplica filtro gaussiano
def gaussianFilter(image):
    return cv2.GaussianBlur(image, (5,5), 1)

  # Aplica filtro bilateral
def bilateralFilter(image):
    return cv2.bilateralFilter(image, 5, 25, 25)

  # Diferença de Gaussian
def dogFilter(image):
    # Apply 3x3 and 7x7 Gaussian blur
    low_sigma = cv2.GaussianBlur(image, (3, 3), 0)
    high_sigma = cv2.GaussianBlur(image, (7, 7), 0)

    # Calculate the DoG by subtracting
    dog = low_sigma - high_sigma
    return dog

def unsharpMask(image):
    gauss = cv2.GaussianBlur(image, (7, 7), 0)
    return cv2.addWeighted(image, 2, gauss, -1, 0)

def laplacianFilter(image):
    blur = cv2.GaussianBlur(image, (9, 9), 0)

    laplacian = cv2.Laplacian(blur, cv2.CV_64F)

    return laplacian/laplacian.max()

  # Filtro 2D de mascara qualquer que pode ser aplicado
def filtro2D(image ,mask = np.array([[0,-1,0],[-1,5,-1],[0,-1, 0]])):
    return cv2.filter2D(image,-1,mask)

  # Filtro Gabor, pode ser usado para acentuar bordas
def gaborFilter(image,ksize, sigma, theta, Lambda, psi, gamma):
    g_kernel = cv2.getGaborKernel(ksize=(ksize, ksize),
                                  sigma=sigma,
                                  theta=1*np.pi / theta,
                                  lambd=1*np.pi / Lambda,
                                  gamma=gamma,
                                  psi=psi,
                                  ktype=cv2.CV_32F)
    return cv2.filter2D(image, cv2.CV_8UC3, g_kernel)

# Funcoes para segmentacao, limiarizacao, crecimento de regiao ou operacoes morfologicas

  # Limiarizacao simples para imagens na faixa 0-255
def simpleThresholding(image, limit):
    return cv2.threshold(image,limit, 255,cv2.THRESH_BINARY)[1]

  # Limiarizacao usando Otsu para imagens na faixa 0-255
def otsuThresholding(image, limit):
    return cv2.threshold(image,limit, 255,cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

  # Limiarizacao adaptativa com bloco 9x9
def adaptiveThresholding(image, method=cv2.BORDER_REPLICATE):
    return cv2.adaptiveThreshold(image, 255,method, cv2.THRESH_BINARY, 9, 5)

  # Watershed para imagens de 3 canais baseado em marcas
def watershedCv(image, markers):
  """image: Input 8-bit 3-channel image.
     markers: Input/output 32-bit single-channel image (map) of markers. It should have the same size as image."""
  return cv2.watershed(image, markers) # Or scikit watershed, the functions are equals

  # GrabCut para extração de objetos
def grabCut(img, newmask):
  mask = np.zeros(img.shape[:2],np.uint8)

  mask = np.where(((newmask>0) & (newmask<255)),cv2.GC_PR_FGD,0).astype('uint8')
  mask[newmask == 0] = cv2.GC_BGD
  mask[newmask == 255] = cv2.GC_FGD

  # Create 2 arrays for background and foreground model
  bgdModel = np.zeros((1,65),np.float64)
  fgdModel = np.zeros((1,65),np.float64)

  mask, bgdModel, fgdModel = cv2.grabCut(img, mask, None, bgdModel, fgdModel, 5, cv2.GC_INIT_WITH_MASK)

  mask = np.where((mask==cv2.GC_BGD )|(mask==cv2.GC_PR_BGD),0,1).astype('uint8')
  print(mask)
  img_out = img*mask[:,:,np.newaxis]
  
  return img_out

# PIPELINE PRINCIPAL - Recebe fatia atual[0] e a ultima sem lesao[1]; 
def main_pipeline(dicom_images):

  # Imagens em escala HU e PNG
  hu_images = [] # Imagem binarizada em -260
  png_images = [] # imagem PNG

  # Mascaras ou objetos gerados durante a extracao
  mask_pulmao = [] # Mascara binaria com interior preto dos pulmoes
  bordas_reconhecidas = [] # Contorno externo dos pulmoes
  mask_objetos = [] # Mascara que possui apenas os objetos
  objetos = [] # Objetos identificados apos a operacao AND

  original = [] # Imagem original convertida em HU sem a binarizacao

  # Acessando as imagens
  for imagem in dicom_images:
    file_path = imagem
    
    # Adicionando a imagem ja para processar
    medical_image = pydicom.read_file(file_path + '.dcm')
    image = medical_image.pixel_array

    auxHu = transform_to_hu(medical_image, image)

    mask_pulmao.append(auxHu)

    # Adicionando a imagem em .png para comparacao
    png_images.append(cv2.imread(file_path + '.png',0))
  
  original = filtro2D(mask_pulmao[0])
  # Processa as 2 imagens com os filtros definidos

  for indx in range(len(dicom_images)):

    # Cria a figura apenas para comparacao das etapas
    plt.figure(figsize=(10,10))
    plt.subplot(131), plt.imshow(png_images[indx], cmap='gray'), plt.axis('off'), plt.title('Original') 
    
    # Thresholding com HU em -260, remove vários ruidos da imagem e outras estruturas que nao sao de interesse
    mask_pulmao[indx] = cv2.threshold(mask_pulmao[indx], -260, 1,cv2.THRESH_BINARY)[1]
    plt.subplot(132), plt.imshow(mask_pulmao[indx], cmap='binary'), plt.axis('off'), plt.title('Limiarizada -260') 

    # Flood fill da regiao externa para deiixar em destaque apenas os pulmoes
    mask_pulmao[indx] = flood_fill(mask_pulmao[indx], (1,1),1)
    plt.subplot(133), plt.imshow(mask_pulmao[indx], cmap='binary'), plt.axis('off'), plt.title('Flood Fill') 
    plt.show()

    # Binary closing, operacao morfologica para reduzir os ruidos na parte externa do pulmao
    mask_pulmao[indx] = binary_closing(mask_pulmao[indx])
    hu_images.append(mask_pulmao[indx].astype('uint8'))
    plt.figure(figsize=(10,10))
    plt.subplot(131), plt.imshow(mask_pulmao[indx], cmap='binary'), plt.axis('off'), plt.title('Binary Closing') 

    # Inversao da imagem para utilizacao do Binary Fill Holes
    mask_pulmao[indx] = np.invert(mask_pulmao[indx])

    # Preenchimento da regiao do pulmao, gerando a mascara final com os pulmoes extraidos
    mask_pulmao[indx] = ndi.binary_fill_holes(mask_pulmao[indx]).astype('uint8')
    plt.subplot(132), plt.imshow(mask_pulmao[indx], cmap='binary'), plt.axis('off'), plt.title('Binary Fill') 
    
    # Encontrando as bordas - find_boundaries ou sobel ou canny(mais lento e fino/preciso) ou cv2.findContours
    boundaries = sobel(mask_pulmao[indx])
    plt.subplot(133), plt.imshow(boundaries, cmap='binary'), plt.axis('off'), plt.title('Border'), plt.xlabel('tese')
    plt.show()

    bordas_reconhecidas.append(boundaries)

  # Buscando os objetos que estão dentro dos pulmões

    # Cria a figura apenas para comparacao das etapas
  plt.figure(figsize=(10,10))
  plt.subplot(131), plt.imshow(hu_images[0], cmap='binary'), plt.axis('off'), plt.title('Imagem base') 
  
    # Realiza a sobreposicao de mascaras com a operacao AND
  and_result = cv2.bitwise_and(mask_pulmao[0],hu_images[0])
  and_result = and_result > 0

    # Remove qualquer objeto que seja menor que 4px ou ~2,8mm
  mask_objetos = remove_small_objects(and_result, 4).astype('uint8')
  plt.subplot(132), plt.imshow(mask_pulmao[0], cmap='binary'), plt.axis('off'), plt.title('Máscara') 

  plt.subplot(133), plt.imshow(mask_objetos, cmap='binary'), plt.axis('off'), plt.title('Operação AND') 
  plt.show()
  
    # Mapeia as labels disponivel na imagem resultado
  objetosLabel, qtdLabel = label(mask_objetos,return_num=2,connectivity=2)
  
  imagemLabel = original

    # Percorrendo as labels encontradas e encontrando seu tamanho real na imagem
  for i in range(1, qtdLabel+1):
    coordenada = np.where(objetosLabel==i)
    #coordX = round(coordenada[0].min() + (coordenada[0].max() - coordenada[0].min()))
    #coordY = round(coordenada[1].min() + (coordenada[1].max() - coordenada[1].min()))
    coordX = coordenada[0][0]
    coordY = coordenada[1][0]
    imagemLabel = flood_fill(imagemLabel,(coordX,coordY),4000,tolerance=240) #260

  plt.imshow(imagemLabel, cmap='gray'), plt.axis('off'), plt.show()

  imagemLabel = cv2.threshold(imagemLabel, 3999, 1,cv2.THRESH_BINARY)[1]
  imagemLabel = imagemLabel > 0

    # Remove qualquer objeto que seja menor que 4px ou ~2,8mm
  imagemLabel = remove_small_objects(imagemLabel, 4).astype('uint8')
  plt.imshow(imagemLabel, cmap='gray'), plt.show()

  # Novos labels gerados pelo processo de inundacao
  objetosLabel = label(imagemLabel, connectivity=2)

  # As propriedades dos objetos sao exraidas com base na nova imagem
  tabelaPropriedades = regionprops_table(objetosLabel, properties=('label', 'area', 'bbox', 'perimeter'))
  
  data = pd.DataFrame(tabelaPropriedades)
  display(data)

  # Lesao recortada manualmente apenas para exemplificação
  index = -1
  minr, minc, maxr, maxc = tabelaPropriedades['bbox-0'][index], tabelaPropriedades['bbox-1'][index], tabelaPropriedades['bbox-2'][index], tabelaPropriedades['bbox-3'][index]

  # Exibindo o recorte
  plt.imshow(objetosLabel[minr:maxr,minc:maxc], cmap='gray'), plt.title("Possível lesão"), plt.axis('off'), plt.show()

  # Convertendo para JSON e salvando
  arquivo_json = data.to_json('./resultado.json', indent=2, double_precision=2)

main_pipeline(['1-044', '1-046'])
