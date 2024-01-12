%Transform Function
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
I = im2double(I);
figure;
EE = 1./(1 + ((0.2)./(double(I) + eps)).^4);
F = 1./(1 + ((0.5)./(double(I) + eps)).^4);
G = 1./(1 + ((0.7)./(double(I) + eps)).^4);
subplot (2,2,1);
imshow (I);
title('Original');
subplot (2,2,2);
imshow (EE);
title('m = 0.2, E = 4');
subplot (2,2,3);
imshow (F);
title('m = 0.5, E = 4');
subplot (2,2,4);
imshow (G);
title('m = 0.7, E = 4');
