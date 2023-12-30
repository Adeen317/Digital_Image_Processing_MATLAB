%Gray Scale, Sampling, Quantization
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
im= imread(path);
imshow(im);figure;
grey=rgb2gray(im);
RI=imresize(grey,0.25);
SI=imresize(RI,2);
imshow(RI); figure;
imshow(SI); figure;
[im2,map]= gray2ind(grey,2^1);
imshow(im2,map);


