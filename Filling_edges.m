% Read the image
grayImage = imread('circles.png');
imshow(grayImage);

% Invert
invertedImage = ~grayImage;

se = strel('disk',6); 
openedImage = imopen(invertedImage, se);

filledImage = ~openedImage;

figure;

subplot(1, 3, 1);
imshow(grayImage);
title('Original Grayscale Image');

subplot(1, 3, 2);
imshow(invertedImage);
title('Inverted Image');

subplot(1, 3, 3);
imshow(filledImage);
title('Filled Image');

