% Read the image
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
originalImage= imread(path);
figure;
subplot(2,3,1);
imshow(originalImage);
title('Original Image');

% i. Image cleansing against noise
grey=rgb2gray(originalImage);
% Example with median filtering
filtered_img = medfilt2(grey);
subplot(2,3,2);
imshow(filtered_img);
title('Image after Noise Reduction');

% ii. Adjust brightness and contrast
adjusted_img = imadjust(filtered_img, [0.2 0.8], []);
subplot(2,3,3);
imshow(adjusted_img);
title('Image after Brightness and Contrast Adjustment');

h1=ones(3,3)/9;
i1=imfilter(adjusted_img,h1);
i2=adjusted_img-i1;
subplot(2,3,4);
imshow(i2);
title('Unsharp Masked Image');
subplot(2,3,5);
high=adjusted_img+i2;
imshow(high);
title('Highboost Filtered Image');


