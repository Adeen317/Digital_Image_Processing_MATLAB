% Read the grayscale image
%Use pepper.tif
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
i= imread(path);
%hsv
%i=rgb2hsv(i);

figure;
subplot(1,4,1);
imshow(i);
title('Original Image')
red=i(:,:,1);
green=i(:,:,2);
blue=i(:,:,3);
subplot(1,4,2);
imshow(red);
title('Red');
subplot(1,4,3);
imshow(green);
title('Green');
subplot(1,4,4);
imshow(blue);
title('Blue');

%Histogram
[x,y]=imhist(red);
[x1,y1]=imhist(green);
[x2,y2]=imhist(blue);
figure;
stem([x,y]);
hold on;
stem([x1,y1]);
hold on;
stem([x2,y2]);
hold on;
c=cat(3,red,green,blue);

%intensity
figure;
intensity=c*0.15;
imshow(intensity);
title('Intensity=15%')