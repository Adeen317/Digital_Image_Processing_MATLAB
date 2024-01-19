[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
i= imread(path);

figure;
subplot(1,2,1);
imshow(i);
title('Original Image')
red=i(:,:,1);
green=i(:,:,2);
blue=i(:,:,3);
newimg=zeros(size(i));
newimg(:,:,1)=red;
newimg(:,:,2)=green;
newimg(:,:,3)=blue;
subplot(1,2,2);
imshow(newimg);
title('Colors in Intensity Plane')