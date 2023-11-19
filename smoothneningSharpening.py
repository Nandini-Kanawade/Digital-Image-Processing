import numpy as np
import cv2
import matplotlib.pyplot as plt
from google.colab.patches import cv2_imshow
from skimage.util import random_noise

# Path to the image file
path = "/content/Games.jpg"

# Read the image
I = cv2.imread(path)

# Display the original BGR image
plt.imshow(I)
plt.title("BGR Image")
plt.axis('off')
plt.show()

# Convert BGR image to RGB
I = cv2.cvtColor(I, cv2.COLOR_BGR2RGB)

# Display the RGB image
plt.imshow(I)
plt.title("RGB Image")
plt.axis('off')
plt.show()

# Add noise to the image
I2 = random_noise(I, mode='s&p', amount=0.3)

# Display the noisy image
plt.imshow(I2)
plt.title("Noisy Image")
plt.axis('off')
plt.show()

# Apply box filter to reduce noise
box = cv2.blur(I2, (15, 15))

# Display the image after applying the box filter
plt.imshow(box)
plt.title("Box Filter Applied Image")
plt.axis('off')
plt.show()

# Apply median filter to reduce noise
median = cv2.medianBlur(I2.astype('float32'), 5)

# Display the image after applying the median filter
plt.imshow(median)
plt.title("Median Filter Applied Image")
plt.axis('off')
plt.show()

# Define a sharpening kernel
kernel = np.array([[-1, -1, -1],
                   [-1,  9, -1],
                   [-1, -1, -1]])

# Apply the sharpening kernel using filter2D
sharpened_img = cv2.filter2D(median, -1, kernel=kernel)

# Display the sharpened image
plt.imshow(sharpened_img)
plt.title("Sharpened Image")
plt.axis('off')
plt.show()
