%%
% 1.a b c 
I = imread('lena.jpg');
[height, width] = size(I);
I_gaussian = imnoise(I,'gaussian');
I_salt_pepper = imnoise(I,'salt & pepper');
noise = sqrt(-1500*log((1-rand(height,width))));
I_rayleigh = double(I) + noise;
I_rayleigh = uint8(I_rayleigh);

subplot(2,2,1),imshow(I);
subplot(2,2,2),imshow(I_gaussian);
subplot(2,2,3),imshow(I_salt_pepper);
subplot(2,2,4),imshow(I_rayleigh);

%%
%2.a) Arithmetic mean filter
% Generally tood with any noise. 
 ari_I = imfilter(I,fspecial('average',[5 5]));
 ari_I2 = imfilter(I_gaussian,fspecial('average',[5 5]));
 ari_I3 = imfilter(I_salt_pepper,fspecial('average',[5 5]));
 ari_I4 = imfilter(I_rayleigh,fspecial('average',[5 5]));
 
subplot(2,4,1),imshow(I);subplot(2,4,2),imshow(I_gaussian);
subplot(2,4,3),imshow(I_salt_pepper);subplot(2,4,4),imshow(I_rayleigh);
subplot(2,4,5),imshow(ari_I);subplot(2,4,6),imshow(ari_I2);
subplot(2,4,7),imshow(ari_I3);subplot(2,4,8),imshow(ari_I4);
%%
%2.b) Geometric mean filter:
% It made the worst result for salt and pepper however gaussian, rayleigh
% made good results.
 geo_I = exp(imfilter(log(double(I)),ones(5,5),'replicate')).^(1/(5*5));
 geo_I2 =  exp(imfilter(log(double(I_gaussian)),ones(5,5),'replicate')).^(1/(5*5));
 geo_I3 = exp(imfilter(log(double(I_salt_pepper)),ones(5,5),'replicate')).^(1/(5*5));
 geo_I4 = exp(imfilter(log(double(I_rayleigh)),ones(5,5),'replicate')).^(1/(5*5));
 
subplot(2,4,1),imshow(I);subplot(2,4,2),imshow(I_gaussian);
subplot(2,4,3),imshow(I_salt_pepper);subplot(2,4,4),imshow(I_rayleigh);
subplot(2,4,5),imshow(uint8(geo_I));subplot(2,4,6),imshow(uint8(geo_I2));
subplot(2,4,7),imshow(uint8(geo_I3));subplot(2,4,8),imshow(uint8(geo_I4));
%%
%2.c) Harmonic mean filter:
% It made the worst result for salt and pepper however gaussian, rayleigh
% made good results. Pretty similar to geometrix filter.
 har_I = (5*5) ./ imfilter(1 ./ (double(I) + eps), ones(5, 5), 'replicate');
 har_I2 = (5*5) ./ imfilter(1 ./ (double(I_gaussian) + eps), ones(5, 5), 'replicate');
 har_I3 = (5*5) ./ imfilter(1 ./ (double(I_salt_pepper) + eps), ones(5, 5), 'replicate');
 har_I4 = (5*5) ./ imfilter(1 ./ (double(I_rayleigh) + eps), ones(5, 5), 'replicate');
 
subplot(2,4,1),imshow(I);subplot(2,4,2),imshow(I_gaussian);
subplot(2,4,3),imshow(I_salt_pepper);subplot(2,4,4),imshow(I_rayleigh);
subplot(2,4,5),imshow(uint8(har_I));subplot(2,4,6),imshow(uint8(har_I2));
subplot(2,4,7),imshow(uint8(har_I3));subplot(2,4,8),imshow(uint8(har_I4));
%%
%3.a) Weighted Median Filter
I = imread('lena.jpg');
[row, col] = size(I);
I_salt_pepper = imnoise(I,'salt & pepper',0.2);
% 3.b)
W = [1,1,1,1,1;1,1,1,1,1; 1,1,5,1,1; 1,1,1,1,1; 1,1,1,1,1]
I_result = I;
I_result1 = I;
for x = 3:1:row-2
    for y = 3:1:col-2
        A = I(x-2:x+2, y-2:y+2);
        I_result(x,y) = median(median(A));
        A = double(I(x-2:x+2, y-2:y+2)); 
        C = A.*W;
        I_result1(x,y) = median(A,'all');

    end
end

I_result_salt = I_salt_pepper;
I_result_salt1 = I_salt_pepper;
for x = 3:1:row-2
    for y = 3:1:col-2
        A = I_salt_pepper(x-2:x+2, y-2:y+2);
        I_result_salt(x,y) = median(median(A));
        A = double(I_salt_pepper(x-2:x+2, y-2:y+2));
        C = A.*W;
        I_result_salt1(x,y) = median(A,'all');
    end
end
subplot(3,2,1),imshow(I);
subplot(3,2,2),imshow(I_salt_pepper);
subplot(3,2,3),imshow(uint8(I_result));
subplot(3,2,4),imshow(uint8(I_result_salt));
subplot(3,2,5),imshow(uint8(I_result1));
subplot(3,2,6),imshow(uint8(I_result_salt1));
%%