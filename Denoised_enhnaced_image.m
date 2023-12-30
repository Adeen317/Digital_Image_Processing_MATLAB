% Read the image
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
originalImage= imread(path);

% Apply Gaussian blur for denoising
denoisedImage = imgaussfilt(originalImage, 2);

grayImage = rgb2gray(originalImage);

% Apply histogram equalization for contrast enhancement
enhancedImage = histeq(grayImage);
% Convert back to RGB
enhancedImage = cat(3, enhancedImage, enhancedImage, enhancedImage);



% Display the original and processed images
figure;
subplot(2, 2, 1), imshow(originalImage), title('Original Image');
subplot(2, 2, 2), imshow(denoisedImage), title('Denoised Image');
subplot(2, 2, 3), imshow(grayImage), title('Gray Scale Image');
subplot(2, 2, 4), imshow(enhancedImage), title('Enhanced Image');

% Save the processed image
imwrite(denoisedImage, 'denoised_image.png');
