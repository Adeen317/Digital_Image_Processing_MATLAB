%Boundary Extraction
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
grey=rgb2gray(I);
binaryImage = imbinarize(grey);

% Display the original binary image
figure;
subplot(1, 2, 1);
imshow(binaryImage);
title('Original Binary Image');

%Opening Operations

%Structuring Element
se = strel('square', 5);

%Erosion
erodedImage = imerode(binaryImage, se);

%Boundary Extraction
boundary=binaryImage-erodedImage;
subplot(1, 2, 2);
imshow(boundary);
title('Boundary Extraction');