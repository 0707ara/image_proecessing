%%
% 1.a
I = imread('fruits.jpg');
I2 = imread('festia.jpg');
eq_R = histeq(I(:,:,1));
eq_G = histeq(I(:,:,2));
eq_B = histeq(I(:,:,3));

eq_R2 = histeq(I2(:,:,1));
eq_G2 = histeq(I2(:,:,2));
eq_B2 = histeq(I2(:,:,3));
I_hist = cat(3, eq_R, eq_G, eq_B);
I_hist2 = cat(3, eq_R2, eq_G2, eq_B2);
% 1.b
I_hsv = intensityeq(I);
I2_hsv = intensityeq(I2);



% 1.c

subplot(3,2,1);imshow(I,[]); title('fruits.jpg'); 
subplot(3,2,2);imshow(I2,[]);title('festia.jpg');
subplot(3,2,3);imshow(I_hist,[]);title('fruit Histogram equalized');
subplot(3,2,4);imshow(I_hist2,[]);title('festia Histogram equalized');
subplot(3,2,5);imshow(I_hsv,[]);title('fruits hsv');
subplot(3,2,6);imshow(I2_hsv,[]);title('festia hsv');

%%
% 2.a
I3 = imread('lake.jpg');
I4 = I3;
[row, col] = size(I3);
I3_hsv = rgb2hsv(I3);
subplot(3,2,1);imshow(I3(:,:,1),[]); %title('fruits.jpg'); 
subplot(3,2,2);imshow(I3(:,:,2),[]); %title('festia.jpg');
subplot(3,2,3);imshow(I3(:,:,3),[]); %title('fruit Histogram equalized');

% graythresh, im2bw, bwlabel
level = graythresh(I3_hsv)
BW = im2bw(I3_hsv,level);
L = bwlabel(BW,8);


I3_mask = zeros(size(I3));
ind = repmat( L, [ 1 1 3] ) == 716; 
I3_mask(ind) = I3(ind);

figure, imshow(uint8(I3_mask),[]);