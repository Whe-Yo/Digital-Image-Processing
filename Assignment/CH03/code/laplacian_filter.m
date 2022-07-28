clear;
clc;

image = imread('src/Fig0222(a)(face).tif');

[m,n] = size(image);

zero_padding_image = [zeros(1,n); image; zeros(1,n);];
zero_padding_image = [zeros(m+2,1), zero_padding_image, zeros(m+2,1);];

% Laplacian filter

laplacian_mask_image = [0 1 0; 1 -4 1; 0 1 0;];
result_image = zeros(m,n);

for y = 1 : m-1
    for x = 1 : n-1
        result_image(y,x) = sum(sum(laplacian_mask_image.*double(zero_padding_image(y:y+2,x:x+2))));
    end
end
    result_image = uint8(result_image);

figure;
subplot(2,4,1), imshow(uint8(image));
subplot(2,4,2), imshow(uint8(result_image));