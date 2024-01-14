%Morphological Operations

[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);

%Erosion
grey=rgb2gray(I);
binaryImage = imbinarize(grey); % Ensure binary format
figure;
subplot(1, 3, 1);
imshow(binaryImage);
title('Original Binary Image');

% Define structuring element 1 (disk)
se1 = strel('disk', 5);

% Apply erosion with structuring element 1
erodedImage1 = imerode(binaryImage, se1);
subplot(1, 3, 2);
imshow(erodedImage1);
title('Erosion with Disk Structuring Element');

% Define structuring element 2 (square)
se2 = strel('square', 3);

erodedImage2 = imerode(binaryImage, se2);

% Display the result of erosion with structuring element 2
subplot(1, 3, 3);
imshow(erodedImage2);
title('Erosion with Square Structuring Element');

%Opening and Closing

