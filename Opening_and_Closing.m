%Opening & Closing Operations
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
subplot(1, 3, 1);
imshow(binaryImage);
title('Original Binary Image');

%Opening Operations

%Structuring Element
seOpening = strel('disk', 5);

%Erosion
erodedImage = imerode(binaryImage, seOpening);

%Dilation
openedImage = imdilate(erodedImage, seOpening);
subplot(1, 3, 2);
imshow(openedImage);
title('Opening Operation');

%Closing Operation

%Structuring Element
seClosing = strel('disk', 5);

%Dilation
dilatedImage = imdilate(binaryImage, seClosing);

%Erosion
closedImage = imerode(dilatedImage, seClosing);
subplot(1, 3, 3);
imshow(closedImage);
title('Closing Operation');
