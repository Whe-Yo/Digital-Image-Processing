clear;
clc;

image = imread("src/Fig0505.tif");
image_no = image;
image_sm = image;
image_sh = image;

[h, w] = size(image);

f0 = figure;
subplot(2,3,1), imshow(image), title('original');

%% 솔트&페퍼

image_no = imnoise(image, 'salt & pepper', 0.05);

f0;
subplot(2,3,4), imshow(image_no), title('noise');

%% 가우시안

image_sm = imgaussfilt(image_no,[3,3]);

f0;
subplot(2,3,5), imshow(image_sm), title('smoothing');

%% 샤프닝

image_sh = imsharpen(image_sm, 'Radius', 3, 'Amount', 3);

f0;
subplot(2,3,6), imshow(image_sh), title('sharpening');
