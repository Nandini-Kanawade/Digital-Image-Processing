% Clear the command window, close all figures, and clear all variables
clc;
close all;
clear all;

% Read an image
I = imread('IMG_1192.jpg');

% Convert the image to grayscale
figure(1);
I_gray = rgb2gray(I);
imshow(I_gray);
title("Original Image");

% Apply Discrete Cosine Transform (DCT) and display the result
figure(2);
I_double = im2double(I_gray);
I_dct = dct2(I_double);
imshow(I_dct);
title("After Applying DCT");

% Apply Inverse Discrete Cosine Transform (IDCT) and display the recovered image
figure(3);
I_dct_double = im2double(I_dct);
I_recovered = idct2(I_dct_double);
imshow(I_recovered);
title("After Applying IDCT: Recovered Image");
