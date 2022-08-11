clear;
clc;

image = imread("src/Fig0505.tif");

[h, w] = size(image);

f0 = figure;
subplot(2,3,1), imshow(image), title('original');

%%

image_fft = fft2(image);

image_cfft = fftshift(image_fft);

