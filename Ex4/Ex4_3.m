input1 = imread('spine.jpg');
input2 = imread('church.png');
output = imread('corel.png');
histequal(input2,output)

function histequal(input1,output)
file_length = size(input1);
histogram = zeros(1,256);
cdf = zeros(1,256);
% Generate histogram for original image I
for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         histogram(input1(row_index,col_index)+1) =  histogram(input1(row_index,col_index)+1)+ 1;
    end
end
figure, bar(histogram)
% Generate pdf 
pdf = histogram /(file_length(1) * file_length(2));
for index=1:256
    cdf(index) =  sum(pdf(1:index));
end


file_length_output = size(output);
histogram_output = zeros(1,256);
cdf_output = zeros(1,256);
% Generate histogram for output image I
for row_index=1:file_length_output(1)
    for col_index=1:file_length_output(2)            
         histogram_output(output(row_index,col_index)+1) =  histogram_output(output(row_index,col_index)+1)+ 1;
    end
end
figure, bar(histogram_output)
% Generate pdf 
pdf_output = histogram_output /(file_length_output(1) * file_length_output(2));
for index=1:256
    cdf_output(index) =  sum(pdf_output(1:index));
end
% Applying 
% figure, imshow(cdf_output);
M = zeros(256,1,'uint8');
for idx = 1 : 256
    [~,ind] = min(abs(cdf(idx) - cdf_output));
    M(idx) = ind-1;
end

out = M(double(input1)+1);
figure,imshow(out);
final_output_size = size(out);
histogram_output2 = zeros(1,256);
for row_index=1:final_output_size(1)
    for col_index=1:final_output_size(2)            
         histogram_output2(out(row_index,col_index)+1) =  histogram_output2(out(row_index,col_index)+1)+ 1;
    end
end
figure, bar(histogram_output2)
end


% https://stackoverflow.com/questions/26763974/histogram-matching-of-two-images-without-using-histeq
% 4.a
% the value of the histogram equalization does not change when it is
% multiplied by itself. Once its equalized it does not change. 
% 4.b
% for spine most of the pixels are less then 50 value
% for moon; values are normaly distributed on middle
% im1 = imread('spine.jpg');
% im2 = imread('moon.png');
% hist1 = imhist(im1); %// Compute histograms
% hist2 = imhist(im2);
% figure,bar(hist1);
% figure,bar(hist2);
% enhanced1 = histeq(im1);
% enhanced2 = histeq(im2);
% figure,imshow(enhanced1);
% figure,imshow(enhanced2);
% hist1 = imhist(enhanced1); %// Compute histograms
% hist2 = imhist(enhanced2);
% figure,bar(hist1);
% figure,bar(hist2);



