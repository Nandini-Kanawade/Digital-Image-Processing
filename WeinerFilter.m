% Clear command window, workspace, and close all figures
clc;
clear all;
close all;

% Read the original image
Original_Image = imread('cameraman.tif');
subplot(2,2,1);
imshow(Original_Image);
title('Original Image');

% Add motion blur to the original image
PSF = fspecial('motion', 12, 45);
Idouble = im2double(Original_Image);

% Perform convolution to simulate motion blur
blurred = imfilter(Idouble, PSF, 'conv', 'circular');
subplot(2,2,2);
imshow(blurred);
title('Blurred Image');

% Restore the blurred image using deconvolution
wnr1 = deconvwnr(blurred, PSF);
subplot(2,2,3);
imshow(wnr1);
title('Restored Image');

% Calculate performance parameters (SSIM and PSNR)
ssimval = ssim(wnr1, Idouble);
disp('SSIM value:');
disp(ssimval);
psnrval = psnr(wnr1, Idouble);
disp('PSNR value:');
disp(psnrval);
