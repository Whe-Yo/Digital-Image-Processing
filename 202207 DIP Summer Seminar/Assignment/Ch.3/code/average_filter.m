clear;
clc;

image = imread('src/Fig0222(a)(face).tif');

[m,n] = size(image);

zero_padding_image = [zeros(1,n); image; zeros(1,n);];
zero_padding_image = [zeros(m+2,1), zero_padding_image, zeros(m+2,1);];

%Average_filter
    
average_mask_image = ones(5,5)./25;
result_image = zeros(m,n);

for y = 1 : m-2
    for x = 1 : n-2
        result_image(y,x) = sum(sum(average_mask_image.*double(zero_padding_image(y:y+4,x:x+4))));
    end
end
    result_image = uint8(result_image);

figure;
subplot(2,4,1), imshow(uint8(image));
subplot(2,4,2), imshow(uint8(result_image));