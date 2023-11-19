% Read and Decompose into 3 channels
I = imread('Games.jpg');
I_R = I(:,:,1);
I_G = I(:,:,2);
I_B = I(:,:,3);

% Display the original and individual channels
figure(1);
subplot(2,2,1);
imshow(I);
title("Original Image");
subplot(2,2,2);
imshow(I_R);
title("Red Channel");
subplot(2,2,3);
imshow(I_G);
title("Green Channel");
subplot(2,2,4);
imshow(I_B);
title("Blue Channel");

% Binarize into the 3 channels
IR_B = imbinarize(I_R);
IG_B = imbinarize(I_G);
IB_B = imbinarize(I_B);

% Display the original and binarized channels
figure(2);
subplot(2,2,1);
imshow(I);
title("Original Image");
subplot(2,2,2);
imshow(IR_B);
title("Red Channel Binarized");
subplot(2,2,3);
imshow(IG_B);
title("Green Channel Binarized");
subplot(2,2,4);
imshow(IB_B);
title("Blue Channel Binarized");

% Arithmetic Operations on the images
Pattern = imread("Pattern.jpg");
Pattern_resized = imresize(Pattern,[600 800]);
Pattern_Channelized = Pattern_resized(:,:,1);
Pattern_Binarized = imbinarize(Pattern_Channelized);

addition = imadd(IR_B, Pattern_Binarized);
substraction = imsubtract(IR_B, Pattern_Binarized);
multiply = immultiply(IR_B, Pattern_Binarized);
divide = imdivide(IR_B, Pattern_Binarized);

% Display arithmetic operation results
figure(3);
subplot(2,3,1);
imshow(IR_B);
title("Image 1");
subplot(2,3,2);
imshow(Pattern_Binarized);
title("Image 2");
subplot(2,3,3);
imshow(addition);
title("Image 1 + 2");
subplot(2,3,4);
imshow(substraction);
title("Image 1 - 2");
subplot(2,3,5);
imshow(multiply);
title("Image 1 x 2");
subplot(2,3,6);
imshow(divide);
title("Image 1 / 2");

% Logical Operations on Images
figure(4);
subplot(2,3,1);
imshow(IR_B);
title("Image 1");
subplot(2,3,2);
imshow(Pattern_Binarized);
title("Image 2");
subplot(2,3,3);
imshow(IR_B | Pattern_Binarized);
title("Image 1 OR 2");
subplot(2,3,4);
imshow(IR_B & Pattern_Binarized);
title("Image 1 AND 2");
subplot(2,3,5);
temp = xor(IR_B, Pattern_Binarized);
imshow(temp);
title("Image 1 XOR 2");
subplot(2,3,6);
imshow(~IR_B);
title("Image ~1");

% Resizing and Rotating Functions
figure(5);
h1 = subplot(1,2,1);
imshow(IR_B);
title("Original Image");
h2 = subplot(1,2,2);
temp = imresize(IR_B, 2);
imshow(temp);
title("Expanded by factor 2");
linkaxes([h2,h1]);

figure(6);
h3 = subplot(1,2,1);
imshow(IR_B);
title("Original Image");
h4 = subplot(1,2,2);
temp = imresize(IR_B, 0.5);
imshow(temp);
title("Resized by a factor 0.5");
linkaxes([h3,h4]);

figure(7);
h5 = subplot(1,2,1);
imshow(IR_B);
title("Original Image");
h6 = subplot(1,2,2);
imshow(imrotate(IR_B, 180));
title("Rotated by 180 degrees");
linkaxes([h5,h6]);
