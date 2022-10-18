I=imread('cameraman.tif');
% I_noise = I + randi(10,256,'uint8');
% directional_filtering(I_noise,3);
%   directional_filtering(I_noise,5);
 directional_filtering(I_noise,7);
function directional_filtering(input,filter_size)
mid_size = round(filter_size/2);
% Filters
filter1 = zeros(filter_size);
filter1(mid_size,:) = 1/filter_size
filter3 = rot90(filter1)
z = ones(1,filter_size) * (1/filter_size)
filter4 = diag(z)
filter2 = flip(filter4,2)
% Filtered images
filter1Image = imfilter(double(input), filter1);
filter2Image = imfilter(double(input), filter2);
filter3Image = imfilter(double(input), filter3);
filter4Image = imfilter(double(input), filter4);
% Plotting images
subplot(2, 2, 1),imshow(uint8(filter1Image));
subplot(2, 2, 2),imshow(uint8(filter2Image));
subplot(2, 2, 3),imshow(uint8(filter3Image));
subplot(2, 2, 4),imshow(uint8(filter4Image));
end