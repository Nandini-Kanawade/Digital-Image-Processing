import numpy as np
import cv2
import matplotlib.pyplot as plt
from google.colab.patches import cv2_imshow

# Original Image
img_path = "/content/BinaryImage.png"
img = cv2.imread(img_path)
plt.imshow(img)
plt.axis('off')
plt.title("Original Image")
plt.show()

# Defining the kernel
kernel = np.ones((3, 3), np.uint8)

# Erosion of an Image
erosion = cv2.erode(img, kernel, iterations=1)
plt.imshow(erosion)
plt.axis('off')
plt.title("Eroded Image")
plt.show()

# Dilation of an Image
dilation = cv2.dilate(img, kernel, iterations=1)
plt.imshow(dilation)
plt.axis('off')
plt.title("Dilated Image")
plt.show()

# Opening of an Image
opening_img_path = "/content/drive/MyDrive/Year3/4#DIP(PE1)/Lab/3_25August/OPENING.jpeg"
img2 = cv2.imread(opening_img_path)
opening = cv2.morphologyEx(img2, cv2.MORPH_OPEN, kernel)
img3 = cv2.hconcat([img2, opening])
plt.imshow(img3)
plt.axis('off')
plt.title("Opening of an Image")
plt.show()

# Closing of an Image
closing_img_path = "/content/drive/MyDrive/Year3/4#DIP(PE1)/Lab/3_25August/CLOSING.jpeg"
img2 = cv2.imread(closing_img_path)
closing = cv2.morphologyEx(img2, cv2.MORPH_CLOSE, kernel)
img3 = cv2.hconcat([img2, closing])
plt.imshow(img3)
plt.axis('off')
plt.title("Closing of an Image")
plt.show()
