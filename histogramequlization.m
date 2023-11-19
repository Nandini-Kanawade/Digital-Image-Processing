% Clear command window, close all figures, and clear workspace
clc;
close all;
clear all;

% Read image and convert to grayscale
I_rgb = imread('IMG_1191.jpg');
I = rgb2gray(I_rgb);

% Display the low contrast image
figure(1);
imshow(I);
title('Original Image');

% Plot histogram of the low contrast image
figure(2);
imhist(I);
title('Histogram of Original Image');

% Perform Histogram Equalization and display it
figure(3);
I_2 = histeq(I);
imshow(I_2);
title('High Contrast Image');

% Plot histogram of the created high contrast image
figure(4);
imhist(I_2);
title('Histogram of High Contrast Image');
