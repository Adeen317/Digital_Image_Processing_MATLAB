% Read the image
[path, nofile] = imgetfile();
if nofile
    msgbox (sprintf('Image not selected!!!'), 'Error','warning');
    return
end
originalImage= imread(path);
k=rgb2gray(originalImage);
bw = im2bw(k,0.55);
invertedImage = imcomplement(bw);
label= bwlabel(invertedImage);
stats = regionprops(label,'Solidity', 'Area');
area = [stats.Area];
defect = find(area);
defectedarea= ismember(label, defect);
structure_element =strel('square',8);
defectedarea =  imdilate(defectedarea, structure_element);
Bound = bwboundaries(defectedarea, 'noholes');
figure;
subplot(1, 2, 1), imshow(originalImage), title('Original Image');
subplot(1, 2, 2), imshow(invertedImage), title('Processed Image');
hold on;

numBoundaries = length(Bound);
 for i = 1:numBoundaries
        boundary = Bound{i};
        boundaryLength = size(boundary, 1);
        plot(boundary(:, 2), boundary(:, 1), 'y', 'linewidth', 2);
 end