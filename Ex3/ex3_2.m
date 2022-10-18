% 2.a downsampling fun = @(block_struct) imresize(block_struct.data,0.9);

I = imread('mbaboon.bmp');
% fun = @(block_struct) dataencode(blockstruct.data(2:2));
%  fun = @(block_struct) block_struct.data(2:2);
% fun = @(block_struct) block_struct.data(1:1); %big brother is watching
% 2.c
fun = @(block_struct) mean2(block_struct.data);
I2 = blockproc(I,[4 4],fun);
figure;
imshow(uint8(I2));

% 3
% dark adaptation;ability of the retina of the eye to adjust to various levels of light.

% 4
I = imread('man8.PNG');
figure, imhist(I)
I2 = I + 3;
figure,imhist(max(0, I2));
figure,imhist(min(255, I2));
% Does not really make big difference but it shift on amount of C

% 4.2
I = imread('man8.PNG');
figure, imhist(I)
I2 = I *3;
figure, imhist(I2)
% histogram seems stretched depeneds on C.If C is less than 1 it shrinks. 

% 4.c
I_rotate = imrotate(I,90);
figure, imhist(I_rotate);
% Does not really make big difference because eventhough the picture
% rotates that doesnt change the value of the 