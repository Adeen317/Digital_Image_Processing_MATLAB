%Sharpening Filters
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
subplot(2,2,1);
imshow(I);
title('Original Image');

%Sobel Operator
By = [1 2 1; 0 0 0; -1 -2 -1];
Bx = (By)';
Gy = imfilter(I,By);
subplot(2,2,2);
imshow(Gy)
title('Gy')
Gx = imfilter(I,Bx);
subplot(2,2,3);
imshow(Gx)
title('Gx')
G = abs(Gx) + abs(Gy);
subplot(2,2,4);
imshow(G);
title('G')

%Prewitt Operator
figure;
subplot(2,2,1);
imshow(I);
title('Original Image');
hy=fspecial('prewitt');
hx=hy';
gy=imfilter(I,hy);
subplot(2,2,2);
imshow(gy)
title('Gy')
gx=imfilter(I,hx);
subplot(2,2,3);
imshow(gx)
title('Gx')
g=abs(gx)+abs(gy);
subplot(2,2,4);
imshow(g)
title('G(Prewitt)')

%Sharpening
figure;
K = fspecial('gaussian',20, 15);
L = imfilter(I,K);
subplot(2,2,1);
imshow(L);
title('Blurred image');
M = I-L;
subplot(2,2,2);
imshow(M);
title('G = original img - blur img');
N = I +( 1.* M);
subplot(2,2,3);
imshow(N);
title('unsharp mask');
Q = I +( 8.* M);
subplot(2,2,4);
imshow(Q);
title('highboost mask (k = 8)');

