clear;
clc;

image = imread('src/FIGURE0441.tif');
[h, w] = size(image);

P = 2*h; Q = 2*w;
image_centered = zeros(P,Q); 
image_centered(1:h,1:w) = image(1:h,1:w); 
D = [5,10,50,100,200]; 

subplot(2,3,1)
imshow(image);

    for x = 1 : h
        for y = 1 : w
            image_centered(x,y) = double(image_centered(x,y)*(-1)^(x+y));
        end
    end

    F = fft2(image_centered,P,Q);


    H = zeros(P,Q);
for i = 1 : 5
    for u = 1 : P
      for v = 1 : Q
            distance = ((u-(h+1.0))^2 + (v-(w+1.0))^2);
            H(u,v) = exp(((-1)*distance)/(2*(D(i)^2)));
      end
    end


    G = H.*F;
    result = ifft2(G);
    result = real(result);
    for x = 1 : h
        for y = 1 : w
         result(x,y)= double(result(x,y)*(-1)^(x+y));
        end
    end

    realresult (1:h,1:w) = result(1:h,1:w);
   
    subplot(2,3,i+1)
    imshow(uint8(realresult));
    title([num2str(D(i))])
end
realresult_zero = realresult;



