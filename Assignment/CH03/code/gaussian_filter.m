clear;
clc;

image = imread('src/Fig0222(a)(face).tif');
A = imnoise(image,'Gaussian',0.04,0.003);

I = double(A);

sigma = 1.76;

sz = 4;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
 

result_image=zeros(size(I));
%Pad the vector with zeros
I = padarray(I,[sz sz]);

%Convolution 
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        result_image(i,j)=sum(Temp(:));
    end
end

result_image = uint8(result_image);

figure;
subplot(2,4,1), imshow(uint8(image));
subplot(2,4,2), imshow(result_image);