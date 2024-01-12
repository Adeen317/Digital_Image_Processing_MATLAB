%POWER LAW TRANSFORMATION 
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
subplot(1,4,1);
imshow(I);
title('original image');
c=1;
G1=0.3;
G6=5.0;
x1=double(I); 
y1=c*(x1.^G1);
y6=c*(x1.^G6);
subplot(1,4,2);
imshow((y1),[]);
title('(Gamma=0.3)');
subplot(1,4,3);
imshow((y6),[]);
title('(Gamma=5.0)');

%HISTOGRAM EQUALIZATION
subplot(1,4,4);
grey= rgb2gray(I);
histeq(grey);
title('Equalized image');

%Image Enhancement
figure;
K = fspecial('gaussian',20, 15)
L = imfilter(grey,K)
subplot(1,4,1);
imshow(L)
title('Blurred image')
M = grey-L;
subplot(1,4,2);
imshow(M)
title('G = original img - blur img')
N = grey +( 1.* M)
subplot(1,4,3);
imshow(N)
title('unsharp mask')
Q = grey +( 8.* M)
subplot(1,4,4);
imshow(Q)
title('highboost mask (k = 8)');