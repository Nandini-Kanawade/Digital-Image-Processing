import cv2
import numpy as np
from google.colab.patches import cv2_imshow
import matplotlib.pyplot as plt

# Define the kernel for the box filter
box_kernel_size = 5 # Size of the box filter kernel (5x5)
box_kernel = np.ones((box_kernel_size, box_kernel_size), dtype=np.float32) / (box_kernel_size)
print(box_kernel)

# Define the kernel for the weighted average filter
weighted_average_kernel_size = 5 # Size of the weighted average filter kernel (e.g.
weighted_average_kernel = np.array([[1, 2, 1],
[2, 4, 2],
[1, 2, 1]], dtype=np.float32)
weighted_average_kernel /= np.sum(weighted_average_kernel) # Normalize the kernel

sharpening_kernel = np.array([[-1, -1, -1],
[-1, 9, -1],
[-1, -1, -1]], dtype=np.float32)

def apply_filter(image, kernel):
#Apply a convolution filter to the input image.
    return cv2.filter2D(image, -1, kernel)

# Load an image
image = cv2.imread('/content/leena.png')
kernel_size = 5
# Add salt and pepper noise to the image
noise = np.random.choice([0, 255], size=image.shape[:2] + (3,), p=[0.95, 0.05]).astype(np.uint8)
noisy_image = cv2.add(image, noise)

# Apply the box filter
smoothed_box = apply_filter(image, box_kernel)

#Apply the weighted average filter
smoothed_weighted_average = apply_filter(image, weighted_average_kernel)

#Sharpening of image
sharpened_image = apply_filter(image, sharpening_kernel)

# Apply the median filter to remove salt and pepper noise
median_filtered_image = cv2.medianBlur(noisy_image, 5)


# Plot all six images using matplotlib
plt.figure(figsize=(15, 12))
# Original Image
plt.subplot(2, 3, 1)
plt.imshow(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
plt.title('Original Image')
plt.axis('off')
# Noisy Image
plt.subplot(2, 3, 2)
plt.imshow(cv2.cvtColor(noisy_image, cv2.COLOR_BGR2RGB))
plt.title('Noisy Image (Salt & Pepper Noise)')
plt.axis('off')
# Smoothed Image (Box Filter)
plt.subplot(2, 3, 3)
plt.imshow(cv2.cvtColor(smoothed_box, cv2.COLOR_BGR2RGB))
plt.title('Smoothed Image (Box Filter)')
plt.axis('off')
# Smoothed Image (Weighted Average Filter)
plt.subplot(2, 3, 4)
plt.imshow(cv2.cvtColor(smoothed_weighted_average, cv2.COLOR_BGR2RGB))
plt.title('Smoothed Image (Weighted Average Filter)')
plt.axis('off')
# Sharpened Image
plt.subplot(2, 3, 5)
plt.imshow(cv2.cvtColor(sharpened_image, cv2.COLOR_BGR2RGB))
plt.title('Sharpened Image')
plt.axis('off')
# Median Filtered Image (Salt & Pepper Noise Removal)
plt.subplot(2, 3, 6)
plt.imshow(cv2.cvtColor(median_filtered_image, cv2.COLOR_BGR2RGB))
plt.title('Median Filtered Image (Noise Removal)')
plt.axis('off')
plt.tight_layout()
plt.show()
