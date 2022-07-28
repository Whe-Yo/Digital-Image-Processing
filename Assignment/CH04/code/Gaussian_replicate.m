clear;
clc;

image = imread('src/FIGURE0441.tif');
[h, w] = size(image); % M x N 사이즈 원본 이미지

P = 2*h; Q = 2*w;
image_centered = zeros(P,Q); 
image_centered(1:h,1:w) = image(1:h,1:w); 
image_centered(h+1:P,w+1:Q)=image(h,w);
for x = 1:h
    for y = 1:w
    image_centered(x,w+y) = image_centered(x,w);
    image_centered(h+y,x) = image_centered(h,y);
    end
end

D = [5,10,50,100,200];






realresult_zeropadding = realresult;

