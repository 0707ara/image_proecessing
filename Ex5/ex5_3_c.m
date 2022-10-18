% 5.c
% In what situation we would prefer to use a thresholded median filter?
% When we want sharper image result. 
I=imread('miranda1.tif');
% I_noise(row/2-50:row/2+50-1, col/2-50:col/2+50-1) = I_noise(row/2-50:row/2+50-1, col/2-50:col/2+50-1) + randi(10,100,'uint8')
img1_2 = check_threshold(I,img1,2);
img3_2 = check_threshold(I,img3,2);
img3_10 = check_threshold(I,img3,10);   % The bigger threshold the blurry picture 

figure,imshow(img1_2); % Sharper than the original image
figure,imshow(img1);

subplot(2, 2, 1),imshow(img1);
subplot(2, 2, 2),imshow(img1_2);
subplot(2, 2, 3),imshow(img3_2);
subplot(2, 2, 4),imshow(img3_10);
function result = check_threshold(input,output,alpha)
[row, col] = size(input);
result = output;
for x = 1:1:row
    for y = 1:1:col
         if abs(input(x,y) - output(x,y)) > alpha
             result(x,y) = input(x,y);
         end
    end
end

end
