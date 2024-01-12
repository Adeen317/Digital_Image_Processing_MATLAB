%Power Law Transformation 
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
I= imread(path);
figure;
c=1;
G1=0.3;
G2=0.4;
G3=0.6;
G4=1.0;
G5=3.0;
G6=5.0;
x=rgb2gray(I)
x1=double(x); 
y1=c*(x1.^G1);
y2=c*(x1.^G2);
y3=c*(x1.^G3);
y4=c*(x1.^G4);
y5=c*(x1.^G5);
y6=c*(x1.^G6);
subplot(3,3,1);
imshow(x)
title('original image')
subplot(3,3,2);
imshow((y1),[])
title('(Gamma=0.3)')
subplot(3,3,3);
imshow((y2),[])
title('(Gamma=0.4)')
subplot(3,3,4);
imshow((y3),[])
title('(Gamma=0.6)')
subplot(3,3,5);
imshow((y4),[])
title('(Gamma=1.0)')
subplot(3,3,6);
imshow((y5),[])
title('(Gamma=3.0)')
subplot(3,3,7);
imshow((y6),[])
title('(Gamma=5.0)')
