I=imread('miranda1.tif');
[row, col] = size(I);
I_noise = I;
I_noise(row/2-50:row/2+50-1, col/2-50:col/2+50-1) = I_noise(row/2-50:row/2+50-1, col/2-50:col/2+50-1) + randi(20,100,'uint8');
img1 = med_filter(I_noise,3);
img2 = med_filter(I_noise,5);
img3 = med_filter(I_noise,7);
% figure, imshow(I);
figure, imshow(I_noise);

subplot(2, 2, 1),imshow(I_noise);
subplot(2, 2, 2),imshow(img1);
subplot(2, 2, 3),imshow(img2);
subplot(2, 2, 4),imshow(img3);


function output = med_filter(input,filter_size)
output = input;
mid_size = round(filter_size/2);
[row, col] = size(input);
for x = 1+filter_size:1:row-filter_size
    for y = 1+filter_size:1:col-filter_size
         med=median(input(x-filter_size:x+filter_size-1, y-filter_size:y+filter_size-1),'all');
        output(x+filter_size-1-mid_size,y+filter_size-1-mid_size) = med;
    end
end

end

