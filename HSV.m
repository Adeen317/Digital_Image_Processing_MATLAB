% Read the grayscale image
%Use pepper.tif
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
%hsv
i=rgb2hsv(I);

figure;
subplot(1,3,1);
imshow(I);
title('Original Image')
i(:,:,3)=histeq(i(:,:,3));
modifiedhue=mod(i(:,:,1) + 0.2,1);
modifiedsat=min(1, i(:,:,2) * 1.5);
i(:,:,1) = modifiedhue;
i(:,:,2) = modifiedsat;

%Negative Image
negim=255-I;
subplot(1,3,2);
imshow(hsv2rgb(i));
title('Equalizied Intensity');

subplot(1,3,3);
imshow(negim);
title('Negative Image');

