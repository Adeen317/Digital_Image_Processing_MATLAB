[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
grey= imread(path);
subplot(1,3,1);
imshow(grey);
title('Original Image');
h=[0 1 0; 1 8 1; 0 1 0];
h1=ones(3,3)/9;
i1=imfilter(grey,h1);
i2=grey-i1;
subplot(1,3,2);
imshow(i2);
title('Unsharp Masked Image');
subplot(1,3,3);
high=grey+i2;
imshow(high);
title('Highboost Filtered Image');