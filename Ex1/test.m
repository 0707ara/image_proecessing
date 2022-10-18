% 2.c
% I = imread('peppers.png');
% T = Process(I)
% newloc = cd('C:\Users\Ara\Documents\image_processing\Ex1')
% cd(newloc)
% myDir = uigetdir;
% sum = count_zero(S)
% function result = count_zero(x)
%     file_length = size(x);
%     count = 0;
%     for row_index=1:file_length(1)
%         for col_index=1:file_length(2)
%             if x(row_index,col_index) == 0
%                 count = count + 1
%             end
%         end
%     end
%     result = count
% end

% S1 = binary_img(1:4,2:5)
% S2 = binary_img(1:4,6:9)
% S1_zeros = count_zero(S1)
% S2_zeros = count_zero(S2)
% fprintf('Result of counting zeros in S1 and S2 is %d %d',S1_zeros,S2_zeros)
% S_zeros = count_zero(S)
% function result = count_zero(x)
%     file_length = size(x);
%     count = 0;
%     for row_index=1:file_length(1)
%         for col_index=1:file_length(2)
%             if x(row_index,col_index) == 1
%                 count = count + 1;
%             end
%         end
%     end
%     result = count
% end

% S_zeros value: 4503018

% newloc = cd('C:\Users\Ara\Documents\image_processing\Ex1')
% cd(newloc)
% Ex1_batch()
% function Ex1_batch()
%     imagefiles = dir('*.jpg');
%     nfiles = length(imagefiles);
%     for index=1:nfiles
%         currentfilename = imagefiles(index).name;
%         currentimage = imread(currentfilename);
%         result = Process(currentimage);
%         resultfile_name = strcat(extractBetween(currentfilename,"",".jpg"), '.bmp')
%         imwrite(result,char(resultfile_name),'bmp')
%     end
% end
% 
% % 2.c
% function result = Process(x)
%     scale_down = imresize(x, 0.75);
%     imgsize = size(scale_down);
%     right_half = scale_down(:, imgsize(2)/2+1 : end, : );
%     left_half = fliplr(right_half);
%     mirrored = [left_half right_half];
%     result = imrotate(left_half,90);
% end

I1 = uint8(zeros(400,400));
I2 = uint8(zeros(400,400));
I1(1:400,1:400) = 63;
I2(1:400,1:400) = 223;
I1(120:280,120:280) = 127;
I2(120:280,120:280) = 127;

% I1(120:280,120:280) = 71; Looks similar each other.
test = 0;

while test == 0
    input_value = input('Enter 1 for brightening 2 for darkening 0 for exit')
    if input_value == 1
        I1(120:280,120:280) = I1(121,121)+1;
        subplot(1,2,1), imshow(I1)
        subplot(1,2,2), imshow(I2)
    elseif input_value == 2
        I1(120:280,120:280) = I1(121,121)-1;
        subplot(1,2,1), imshow(I1)
        subplot(1,2,2), imshow(I2)
    elseif input_value == 0
        test = 1
        disp('Value is')
        disp(I1(121,121))
    else
        disp('please enter either 0,1,2')
    end    
end
