% Clear the command window, close all figures, and clear all variables
clc;
close all;
clear all;

%% Read and Preprocess Image
% Read the image and convert it to grayscale
I = imread('seg.jpg');
I = rgb2gray(I);
I = imresize(I, [500 500]);

% Display the original image
figure(1);
subplot(2,2,1);
imshow(I);
title("Original Image");

%% Plot Histogram
% Plot the histogram of the grayscale image
subplot(2,2,2);
p = imhist(I);
stem(p);
title("Histogram");
xlabel("Gray Level");
ylabel("Occurrence of Gray Scale");

% Get the size of the image
[M, N] = size(I);

%% Color Segmentation
% Initialize matrices for red, green, and blue channels
red = zeros(M, N);
green = zeros(M, N);
blue = zeros(M, N);

% Perform color segmentation based on intensity levels
for x = 1:M
    for y = 1:N
        if 20 <= I(x, y) && I(x, y) <= 151
            % Pixels in the specified intensity range are set to red
            red(x, y) = 255;
            blue(x, y) = 0;
            green(x, y) = 0;
        else
            % Pixels outside the specified intensity range are set to black
            red(x, y) = 0;
            blue(x, y) = 0;
            green(x, y) = 0;
        end
    end
end

% Combine the color channels to create the final color-segmented image
final = cat(3, red, green, blue);

% Display the color-segmented image
subplot(2,2,3);
imshow(final);
title("Color Segmented Image");
