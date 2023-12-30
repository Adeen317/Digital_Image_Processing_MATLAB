%Thresholding
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
i= imread(path);
grey=rgb2gray(i)
bw = im2bw(grey,0.5);
processedImage = imcomplement(bw);
imshow(processedImage)
