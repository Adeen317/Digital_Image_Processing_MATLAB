%Vertical Horizontal Diagonal Lines

[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
grey=rgb2gray(I);
binaryImage = imbinarize(grey);

%horizontal and vertical boundaries
horizontalBoundaries = imdilate(binaryImage, strel('line', 5, 0)) - binaryImage;
verticalBoundaries = imdilate(binaryImage, strel('line', 5, 90)) - binaryImage;
boundariesImage = binaryImage + horizontalBoundaries + verticalBoundaries;

%Diagonal lines
dB1 = imdilate(binaryImage, strel('line', 5, 45)) - binaryImage;
dB2 = imdilate(binaryImage, strel('line', 5, 135)) - binaryImage;
dB = dB1 + dB2;
boundariesImage = boundariesImage + dB;

% Display original and processed images
figure;

subplot(2, 3, 1);
imshow(binaryImage);
title('Original Binary Image');

subplot(2, 3, 2);
imshow(horizontalBoundaries);
title('Horizontal Boundaries');

subplot(2, 3, 3);
imshow(verticalBoundaries);
title('Vertical Boundaries');

subplot(2, 3, 4);
imshow(dB1);
title('Diagonal Boundaries 45°');

subplot(2, 3, 5);
imshow(dB2);
title('Diagonal Boundaries 135°');

subplot(2, 3, 6);
imshow(boundariesImage);
title('Highlighted Boundaries');


