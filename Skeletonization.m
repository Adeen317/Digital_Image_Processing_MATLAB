%Skeletonization

% Read the binary image
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
grey=rgb2gray(I);
binaryImage = imbinarize(grey);
% Perform skeletonization on the binary image
skeletonizedImage = bwmorph(binaryImage, 'skel', Inf);

% Display the original and processed images side by side
figure;

subplot(1, 2, 1);
imshow(binaryImage);
title('Original Binary Image');

subplot(1, 2, 2);
imshow(skeletonizedImage);
title('Skeletonized Image');

