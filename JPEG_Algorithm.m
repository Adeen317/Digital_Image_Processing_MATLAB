%JPEG Algorithm

% Read the grayscale image (replace 'your_image.jpg' with the actual image file)
originalImage = imread('cameraman.tif');

% Extract an 8x8 subimage (assuming the image is larger)
subImage = originalImage(1:8, 1:8);

% Display the original and subimage
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(subImage);
title('8x8 Subimage');

% a. Perform level shifting
subImageShifted = double(subImage) - 128;

% b. Calculate DCT
dctMatrix = dct(eye(8));
dctResult = dctMatrix * subImageShifted * dctMatrix';

% c. Implement quantization (using a sample quantization matrix)
quantizationMatrix = [16 11 10 16 24 40 51 61;
                      12 12 14 19 26 58 60 55;
                      14 13 16 24 40 57 69 56;
                      14 17 22 29 51 87 80 62; 
                      18 22 37 56 68 109 103 77;
                      24 35 55 64 81 104 113 92;
                      49 64 78 87 103 121 120 101;
                      72 92 95 98 112 100 103 99];

quantizedResult = round(dctResult ./ quantizationMatrix);

% d. Write the 1D vector till EOB using zigzag pattern
zigzagVector = [];
idx = 1;
for sumIdx = 2:16
    if sumIdx <= 9
        for j = 1:sumIdx-1
            i = sumIdx - j;
            zigzagVector(idx) = dctResult(i, j);
            idx = idx + 1;
        end
    else
        for j = sumIdx-8:8
            i = sumIdx - j;
            zigzagVector(idx) = dctResult(i, j);
            idx = idx + 1;
        end
    end
end

% Display results
disp('Original 8x8 Subimage:');
disp(subImage);

disp('Shifted 8x8 Subimage:');
disp(subImageShifted);

disp('DCT Result:');
disp(dctResult);

disp('Quantized Result:');
disp(quantizedResult);

disp('Zigzag Vector:');
disp(zigzagVector);

