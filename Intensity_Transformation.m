[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
subplot(2,3,1);
imshow(I)
title('Original Image')
A = rgb2gray(I)
subplot(2,3,2);
imshow(A)
title('RGB2GRAY')

%Laplacian Filters
B = [ 0 1 0; 1 -4 1; 0 1 0];
C = imfilter(A,B)
subplot(2,3,3);
imshow(C)
title('Laplacian filter (-4)')
D = [ 0 1 0; 1 -8 1; 0 1 0];
E = imfilter(A,D)
subplot(2,3,4);
imshow(E)
title('Laplacian filter (-8)')
F = [ 0 1 0; 1 4 1; 0 1 0];
G = imfilter(A,F)
subplot(2,3,5);
imshow(G)
title('Laplacian filter (4)')
H = [ 0 1 0; 1 8 1; 0 1 0];
J = imfilter(A,H)
subplot(2,3,6);
imshow(J)
title('Laplacian filter (8)');

%Guassian FIlters
figure;
K = fspecial('gaussian',20, 15);
L = imfilter(A,K);
subplot(1,3,1);
imshow(L);
title('Blurred image')
M = A-L;
subplot(1,3,2);
imshow(M)
title('G = original img - blur img');
N = A +( 1.* M);
subplot(1,3,3);
imshow(N);
title('unsharp mask');
