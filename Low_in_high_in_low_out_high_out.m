%[Low in High in][Low out High out]
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
subplot(2,3,1);
imshow(I)
title('original image')
j=imadjust(I, [0 0.2], [0.5 1], 3);
subplot(2,3,2);
imshow(j)
title('GAMMA 3')
subplot(2,3,3);
j=imadjust(I, [0.2 1], [0.5 1], 0.4);
imshow(j)
title('GAMMA 0.4')
subplot(2,3,4);
j=imadjust(I, [0.2 1], [0 1], 2.4);
imshow(j)
title('GAMMA 2.4')
j=imadjust(I, [0.2 1], [0 1], 1.8);
subplot(2,3,5);
imshow(j)
title('GAMMA 1.8')
