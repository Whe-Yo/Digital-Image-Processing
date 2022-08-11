clear;
clc;

I = imread('src/Fig0505.tif');
I=im2double(I);
h=size(I,1); % 높이
w=size(I,2); % 넓이
P=2*h;
Q=2*w;
I1=fft2(I,P,Q); % FFT
I2=fftshift(I1); % Centralized 된 FFT
I3=log(1+abs(I2));
f_max=max(I3(:));
I4=I3/f_max; % 주파수 영역 스펙트럼


[x,y]=meshgrid(-floor(Q/2):floor(Q-1)/2, -floor(P/2):floor(P-1)/2); % (수정필요) meshgrid : 벡터 x 및 y에 포함된 좌표를 바탕으로 2차원 그리드 좌표를 반환
Do=15;n=5;fc=30;
a1=x-110/2; b1=y-145/2;
a2=x-110/2; b2=y+145/2;
a3=x+110/2; b3=y+145/2;
a4=x+110/2; b4=y-145/2;
D1=sqrt(a1.^2+b1.^2);
D2=sqrt(a2.^2+b2.^2);
D3=sqrt(a3.^2+b3.^2);
D4=sqrt(a4.^2+b4.^2);

B1=1./(1.+(Do.*(D1.^(-1))).^(2*n));
B2=1./(1.+(Do./D2).^(2*n));
B3=1./(1.+(Do./D3).^(2*n));
B4=1./(1.+(Do./D4).^(2*n));

I5=I4.*B1.*B2.*B3.*B4;
I6=abs(ifft2(I5));
maxi=max(I6(:));
[min(I6(:)), max(I6(:)), min(maxi), max(maxi)]
I8=im2uint8(I6/maxi);
whos I8; min(I8(:)), max(I8(:)), nnz(I8)

figure
subplot(2,3,1),imshow(I),title('원본 이미지')
subplot(2,3,2),imshow(real(I1)),title('FFT')
subplot(2,3,3),imshow(real(I2)),title('Centralized 된 FFT')
subplot(2,3,4),imshow(I4),title('스펙트럼')
subplot(2,3,5),imshow(I5),title('Notch Reject')
subplot(2,3,6),imshow(I8),title('필터 적용된 이미지')
figure;
imshow(~I8)