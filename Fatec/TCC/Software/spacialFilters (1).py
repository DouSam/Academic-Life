import math
import cv2
import numpy as np
import matplotlib.pyplot as plt

def negativeImg(image):
    # Formula s = L - 1 - r
    
    negativeImg = np.zeros((image.shape[0],image.shape[1]),dtype = 'uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            negativeImg[i,j] = 256 - 1 - image[i,j]
    
    return negativeImg

def logImg(image, c):
    # Formula s = c * log(1 + r)

    logImg = np.zeros((image.shape[0],image.shape[1]),dtype = 'uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            logImg[i,j] = c * math.log(1 + image[i,j])
    
    return logImg

def gammaCorretion(image, c, y):
    # Formula s = c * r ^ y

    gammaImg = np.zeros((image.shape[0],image.shape[1]),dtype = 'uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            gammaImg[i,j] = c * image[i,j] ** y

    return gammaImg

# 55 255
def minMaxContrast(image, min, max):
    # Formula s = (r - xmin) / (xmax - xmin)

    minMaxImg = np.zeros((image.shape[0],image.shape[1]),dtype = 'uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            minMaxImg[i,j] = ((image[i,j] - min) / (max - min)) * 255 # Talvez variar ainda mais o minimo e o máximo, caminhando de 10 em 10

    return minMaxImg

def boxFilter(image):
    return cv2.boxFilter(image,-1,(5,5))

def medianFilter(image):
    return cv2.medianBlur(image,5)

def gaussianFilter(image):
    return cv2.GaussianBlur(image,(5,5),1)

def bilateralFilter(image):
    return cv2.bilateralFilter(image,5,25,25)

def dogFilter(image):
    # Apply 3x3 and 7x7 Gaussian blur
    low_sigma = cv2.GaussianBlur(image,(3,3),0)
    high_sigma = cv2.GaussianBlur(image,(7,7),0)

    # Calculate the DoG by subtracting
    dog = low_sigma - high_sigma
    return dog

def unsharpMask(image):
    gauss = cv2.GaussianBlur(image, (7,7), 0)
    return cv2.addWeighted(image, 2, gauss, -1, 0)

def laplacianFilter(image):
    blur = cv2.GaussianBlur(image,(9,9),0)

    laplacian = cv2.Laplacian(blur,cv2.CV_64F)

    return laplacian/laplacian.max()


# ----------------------------------------------

oriImg = cv2.imread('exam.jpg',cv2.IMREAD_GRAYSCALE)

#i = 50

#while(i<=60):
    #posImg = minMaxContrast(oriImg,i, 255)
    #cv2.imwrite(f'im{i}.png', posImg)
    #i += 1

#logImg = cv2.Hist
#cv2.imshow("Box",boxFilter(oriImg))
#cv2.imshow("Media",medianFilter(oriImg))
#cv2.imshow("Gaussian",gaussianFilter(oriImg))
#cv2.imshow("Bilateral",bilateralFilter(oriImg))
#cv2.imshow("Dif",dogFilter(oriImg))
#cv2.imshow("Unsharp",unsharpMask(oriImg))
cv2.imshow("Laplacian",laplacianFilter(oriImg))
#plt.hist(logImg.ravel(),256,[0,256]); plt.show()
#plt.hist(oriImg.ravel(),256,[0,256]); plt.show()
cv2.waitKey(0)
