%Laplacian Filter

[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
i= imread(path);
figure;
imshow(i);
grey=rgb2gray(i);

for x = [-4 4 -8 8]
    h = [0 1 0; 1 x 1; 0 1 0];
    i1=imfilter(grey,h);
    i2=grey-i1;
    figure;
    subplot(1,2,1);
    imshow(grey);
    title('Original Image');
    
    subplot(1,2,2);
    imshow(i2);
    title(['Laplacian Kernel Middle Value ', num2str(x)]);
end