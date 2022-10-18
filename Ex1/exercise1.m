% cd Documents\image_processing\Ex1\

I = imread('peppers.png');
figure, imshow(I);

% 1.a
I1 = rgb2gray(I);
figure, imshow(I1);

% 1.b
figure, imshow(I(:,:,1)); % Red component
figure, imshow(I(:,:,2)); % Green component
figure, imshow(I(:,:,3)); % Blue component

% 1.c 
% Q. Is there any other way to add 50 value to green label?
I2 = I
figure, imshow(I(:,:,2));  % I2(:,:,2) = I2(:,:,2) + 50 this doesn't work
I2 = cat(3, I2(:,:,1), I2(:,:,2) + 50, I2(:,:,3));
figure, imshow(I2);

% 1.d
 R = I2(:,:,1)
 G = I2(:,:,2)
 B = I2(:,:,3)
 I3 = cat(3, B, G, R);
 figure, imshow(I3)
 
% 1.e
subplot(2,2,1), imshow(I);
subplot(2,2,2), imshow(I1);
subplot(2,2,3), imshow(I2);
subplot(2,2,4), imshow(I3);

% 3.a
binary_img = [0 0 0 0 0 0 0 1 1 0;1 0 0 1 0 0 1 0 0 1;1 0 0 1 0 1 1 0 0 0; 0 0 1 1 1 0 0 0 0 0; 0 0 1 1 1 0 0 1 1 1]
figure, imshow(binary_img)
% 3.b
S1 = binary_img(1:4,2:5)
S2 = binary_img(1:4,6:9)
function result = count_zero(x)
    file_length = size(x);
    count = 0;
    for row_index=1:file_length(1)
        for col_index=1:file_length(2)
            if x(row_index,col_index) == 0
                count = count + 1
            end
        end
    end
    result = count
end
S1_zeros = count_zero(S1)
S2_zeros = count_zero(S2)
fprintf('Result of counting zeros in S1 and S2 is %d %d',S1_zeros,S2_zeros)
S_zeros = count_zero(S)
% S_zeros value: 4503018


