from PIL import Image
from numpy import asarray
from pprint import pprint
import cv2
import numpy as np
import matplotlib.pyplot as plt

# load the image
image = Image.open('negative_image.png')
# convert image to numpy array
data = asarray(image)
print(type(data))
# summarize shape
print(data.shape)

# create Pillow image
image2 = Image.fromarray(data)
print(type(image2))

# summarize image details
print(image2.mode)
print(image2.size)
pprint(data)


# Load the image
img = cv2.imread('exam-img-00001-00001.jpg')
# Check the datatype of the image
print(img.dtype)
# Subtract the img from max value(calculated from dtype)
img_neg = 255 - img
# Show the image
#cv2.imshow('negative',img_neg)
#cv2.imwrite('negative_image.png', img_neg)

im_gray = cv2.imread('exam-img-00001-00001.jpg', cv2.IMREAD_GRAYSCALE)
cv2.imwrite('gray.png', im_gray)
(thresh, im_bw) = cv2.threshold(im_gray, 128, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)

thresh = 127
im_bw = cv2.threshold(im_gray, thresh, 255, cv2.THRESH_BINARY)[1]

#cv2.imwrite('bw_image.png', im_bw)

# Read the image
img1 = cv2.imread('exam-img-00001-00001.jpg',0)

# Create zeros array to store the stretched image
minmax_img = np.zeros((img1.shape[0],img1.shape[1]),dtype = 'uint8')

# Loop over the image and apply Min-Max formulae
#for i in range(img1.shape[0]):
    #for j in range(img1.shape[1]):
        #minmax_img[i,j] = 255*(img1[i,j]-np.min(img1))/(np.max(img1)-np.min(img1))

# Displat the stretched image
#cv2.imshow('Minmax',minmax_img)
#cv2.waitKey(0)

image = cv2.imread('negative_image.png',0)

# Calculate histogram using cv2.calcHist()
hist = cv2.calcHist([image], [0], None, [256], [0,256])
# Display the histogram
plt.plot(hist)

plt.hist(image.flatten(), 256, [0,256])
plt.show()
cv2.waitKey(0)