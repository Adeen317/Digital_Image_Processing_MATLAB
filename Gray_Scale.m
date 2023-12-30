%Gray Scale
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
i= imread(path);
grey=rgb2gray(i)
imshow(grey)