%Segmentation
% Read the grayscale image
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
grayImage=rgb2gray(I);

% Convert grayscale image to binary using thresholding
threshold = 128;
binaryImage = grayImage >= threshold;

% Display original and binary images
figure;

subplot(1, 2, 1);
imshow(grayImage);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(binaryImage);
title('Binary Image (Thresholding)');

% Implement two-level thresholding
threshold1 = 100;
threshold2 = 200;

% Apply thresholds to create binary image
binaryImage = (grayImage >= threshold1) & (grayImage <= threshold2);

% Display original and processed images
figure;

subplot(1, 2, 1);
imshow(grayImage);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(binaryImage);
title('Two-Level Thresholding');

% Display histograms for analysis
%subplot(1, 3, 3);
%imhist(grayImage);
%title('Histogram of Original Image');

