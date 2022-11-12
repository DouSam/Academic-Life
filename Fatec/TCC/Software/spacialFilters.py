import math
import cv2
import numpy as np
import matplotlib.pyplot as plt

def negativeImg(image):
    # Formula s = L - 1 - r

    negative_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            negative_img[i, j] = 256 - 1 - image[i, j]

    return negative_img

def logImg(image, c):
    # Formula s = c * log(1 + r)

    log_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            log_img[i, j] = c * math.log(1 + image[i, j])

    return log_img

def gammaCorretion(image, c, y):
    # Formula s = c * r ^ y

    gamma_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            gamma_img[i, j] = c * image[i, j] ** y

    return gamma_img

# 55 255
def minMaxContrast(image, min, max):
    # Formula s = (r - xmin) / (xmax - xmin)

    min_max_img = np.zeros((image.shape[0], image.shape[1]), dtype='uint8')

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            min_max_img[i, j] = ((image[i, j] - min) / (max - min)) * 255
            # Talvez variar ainda mais o minimo e o máximo, caminhando de 10 em 10

    return min_max_img

def boxFilter(image):
    return cv2.boxFilter(image, -1, (5, 5))

def medianFilter(image):
    return cv2.medianBlur(image, 5)

def gaussianFilter(image):
    return cv2.GaussianBlur(image, (5, 5), 1)

def bilateralFilter(image):
    return cv2.bilateralFilter(image, 5, 25, 25)

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

def simpleThresholding(image, limit):
    return cv2.threshold(image,limit, 255,cv2.THRESH_BINARY)[1]

def otsuThresholding(image, limit):
    return cv2.threshold(image,limit, 255,cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

def adaptiveThresholding(image, method):
    return cv2.adaptiveThreshold(image, 255,method, cv2.THRESH_BINARY, 9, 5)

# ----------------------------------------------

oriImg = cv2.imread('exam.jpg', cv2.IMREAD_GRAYSCALE)

i = 150

# while(i<=220):
#     #posImg = minMaxContrast(oriImg,i, 255)
#     cv2.imshow('threshold', simpleThresholding(oriImg, i))
#     cv2.waitKey(0)
#     i += 10

# logImg = cv2.Hist
# cv2.imshow("Box",boxFilter(oriImg))
# cv2.imshow("Media",medianFilter(oriImg))
# cv2.imshow("Gaussian",gaussianFilter(oriImg))
# cv2.imshow("Bilateral",bilateralFilter(oriImg))
# cv2.imshow("Dif", dogFilter(oriImg))
# cv2.imshow("Unsharp", unsharpMask(oriImg))
# cv2.imshow("Laplacian", laplacianFilter(oriImg))
# cv2.imshow('threshold', simpleThresholding(oriImg, 190))
# cv2.imshow('thresholdAd', adaptiveThresholding(oriImg, cv2.ADAPTIVE_THRESH_MEAN_C))
cv2.imshow('thresholdOtsu', otsuThresholding(oriImg, 190))
# plt.hist(logImg.ravel(),256,[0,256]); plt.show()
# plt.hist(oriImg.ravel(),256,[0,256]); plt.show()
cv2.waitKey(0)
