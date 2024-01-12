%Smoothing Filters
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
subplot(2,2,1)
imshow(I)
title('Original Image')

%Salt & Pepper
A = imnoise(I, 'salt & pepper', 0.04)
subplot(2,2,2);
imshow(A)
title('Noisy Image')

%Averaging Filter
B = ones(3,3)
C = B/9;
D = imfilter(A, C)
subplot(2,2,3);
imshow(D)
title('Filtered Image (3x3): averaginng filter')
E = ones(7,7)
F = E/49;
G = imfilter(A, F)
subplot(2,2,4);
imshow(G)
title('Filtered Image (7x7): averaginng filter');

%Median Filter
J = rgb2gray(I)
K = imnoise(J, 'salt & pepper', 0.04)
H = medfilt2(K, [3,3])
L = medfilt2(K, [7,7]);
figure;
subplot(1,2,1);
imshow (H);
title('filtered image (median filter) 3x3');
subplot(1,2,2);
imshow(L);
title('filtered image (median filter) 7x7');

%Fspecial
x1 = fspecial('average', [3,3])
M = imfilter(A,x1)
subplot(1,3,1)
imshow(M)
title('average filter using fspecial')
N = fspecial('motion',2, 5)
O = imfilter(K,N)
subplot(1,3,2)
imshow(O)
title('motion filter using fspecial')
P = fspecial('gaussian',12, 5)
Q = imfilter(K,P)
subplot(1,3,3)
imshow(Q)
title('gaussian filter using fspecial')


