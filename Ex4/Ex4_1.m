% 1.a
I = imread('university.png');
I2 = I + 1;
I3 = 50*log(double(I2));
imshow(uint8(I3));
% imshow(I2);
% 1.b
I4 = 1.9 * double(I).^1.5;
imshow(uint8(I4));
% The difference between the two pictures are first one doesnt contrast but
% enhance the entire image however the second method enhance the contrast
% as well.

file_length = size(I);
histogram = zeros(1,256);
cdf = zeros(1,256);
% Generate histogram for original image I
for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         histogram(I(row_index,col_index)+1) =  histogram(I(row_index,col_index)+1)+ 1;
    end
end
figure, bar(histogram)
% Generate pdf 
pdf = histogram /(file_length(1) * file_length(2))
figure, bar(pdf)
% Generate cdf
for index=1:256
    cdf(index) =  sum(pdf(1:index));
end
figure, bar(cdf);
% Equalize the histogram using cdf
result = cdf * (256-1);
figure, bar(result)
I4 = I;
for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         I4(row_index,col_index) =  result(I(row_index,col_index)+1);
    end
end
% Checking for histogram of the result 
% histogram2 = histogram;
% for row_index=1:file_length(1)
%     for col_index=1:file_length(2)            
%          histogram2(I(row_index,col_index)+1) =  histogram2(I(row_index,col_index)+1)+ 1;
%     end
% end
% figure, bar(histogram2);

%%%%% Final result of equlized image
figure, imshow(uint8(I4));
% ContrastStretchfunction doesn't change anything. Therefore no enhancement
% found. 
% x = I
function result = ContrastStretch(x)
a = min(x(:)); %0
b = max(x(:)); %255
result = (x-a).*(255/(b-a));
end
figure, imshow(result);
figure, imshow(I);