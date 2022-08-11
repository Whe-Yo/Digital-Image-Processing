clear;
clc;

image1 = imread('src/Fig0320(1)(top_left).tif');
iamge2 = imread('src/Fig0320(2)(2nd_from_top).tif');
image3 = imread('src/Fig0320(3)(third_from_top).tif');
imabe4 = imread('src/Fig0320(4)(bottom_left).tif');

%결과 영상
result_image1 = image1;
result_image2 = iamge2;
result_image3 = image3;
result_image4 = imabe4;

%높이, 너비
[h,w] = size(image1);

%입력 영상 히스토그램
image_histo1 = zeros(1,256);
image_histo2 = zeros(1,256);
image_histo3 = zeros(1,256);
image_histo4 = zeros(1,256);

%결과 영상 히스토그램
result_histo1 = zeros(1,256);
result_histo2 = zeros(1,256);
result_histo3 = zeros(1,256);
result_histo4 = zeros(1,256);

% 히스토그램 구하기
for y = 1 : h
    for x = 1 :w
        image_histo1(image1(y,x)+1) = image_histo1(image1(y,x)+1)+1;
        image_histo2(iamge2(y,x)+1) = image_histo2(iamge2(y,x)+1)+1;
        image_histo3(image3(y,x)+1) = image_histo3(image3(y,x)+1)+1;
        image_histo4(imabe4(y,x)+1) = image_histo4(imabe4(y,x)+1)+1;
    end
end

% PDF 정규화
image_pdf1 = image_histo1/(h*w);
image_pdf2 = image_histo2/(h*w);
image_pdf3 = image_histo3/(h*w);
image_pdf4 = image_histo4/(h*w);

% CDF
image_cdf1 = image_pdf1;
image_cdf2 = image_pdf2;
image_cdf3 = image_pdf3;
image_cdf4 = image_pdf4;

for i = 2 : 256
    image_cdf1(i) = image_cdf1(i-1)+image_pdf1(i);
    image_cdf2(i) = image_cdf2(i-1)+image_pdf2(i);
    image_cdf3(i) = image_cdf3(i-1)+image_pdf3(i);
    image_cdf4(i) = image_cdf4(i-1)+image_pdf4(i);
end

% CDF 정규화
for y = 1 : h
    for x = 1 : w
        result_image1(y,x) = round(image_cdf1(image1(y,x)+1)*255);
        result_image2(y,x) = round(image_cdf2(iamge2(y,x)+1)*255);
        result_image3(y,x) = round(image_cdf3(image3(y,x)+1)*255);
        result_image4(y,x) = round(image_cdf4(imabe4(y,x)+1)*255);
    end
end

% 히스토그램 Equalization
for y = 1 : h
    for x = 1 : w
        result_histo1(result_image1(y,x)+1) = result_histo1(result_image1(y,x)+1)+1;
        result_histo2(result_image2(y,x)+1) = result_histo2(result_image2(y,x)+1)+1;
        result_histo3(result_image3(y,x)+1) = result_histo3(result_image3(y,x)+1)+1;
        result_histo4(result_image4(y,x)+1) = result_histo4(result_image4(y,x)+1)+1;
    end
end

% 출력
figure;
subplot(2,4,1), imshow(uint8(image1));
subplot(2,4,2), imshow(uint8(result_image1));
subplot(2,4,3), bar(image_histo1);
subplot(2,4,4), bar(result_histo1);

subplot(2,4,5), imshow(uint8(iamge2))
subplot(2,4,6), imshow(uint8(result_image2))
subplot(2,4,7), bar(image_histo2);
subplot(2,4,8), bar(result_histo2);

figure;
subplot(2,4,1), imshow(uint8(image3));
subplot(2,4,2), imshow(uint8(result_image3));
subplot(2,4,3), bar(image_histo3);
subplot(2,4,4), bar(result_histo3);

subplot(2,4,5), imshow(uint8(imabe4));
subplot(2,4,6), imshow(uint8(result_image4));
subplot(2,4,7), bar(image_histo4);
subplot(2,4,8), bar(result_histo4);

