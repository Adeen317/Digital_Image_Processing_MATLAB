%Histogram Equalizaiton
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
subplot(1,3,1);
a = rgb2gray(I);
imshow(a)
title('Original Image')
subplot(1,3,2);
histeq (a)
title('Equalization')
subplot(1,3,3);
imhist(a)
title('Histogram ')

%histogram equalization without built-in function
figure;
b = rgb2gray(I);
imshow(b)
[r,c] = size(b);
length = r*c;
sh = reshape(b,length,1); %image converted to 1 dimensional now from 2
bin = 256;
d = zeros(1,bin);
for i = 1:length
 d(sh (i) +1 ) = d(sh (i) +1 ) + 1;
end
stem(d);
pdf = d/sum(d);
cdf = zeros(1,bin);
new = zeros(1,bin);
out = zeros(1,bin);
cdf (1)= pdf (1);
for j = 2:bin
 cdf(j) = cdf (j-1)+pdf(j);
 new(j)=cdf(j)*(bin-1);
 out(j)= round(new(j));
end
Ieq= uint8(zeros(1,bin));
for k=1:r
 for l= 1:c
 Ieq(k,l)= out(a(k,l)+1);
 end
end
figure;
imshow(Ieq)
title('Equalized Image')
