% 2.a
% Clear the workspace memory : clear all, close all

% 2.b 
% Create Ex_batch.m

% 2.d
newloc = cd('C:\Users\Ara\Documents\image_processing\Ex1')
cd(newloc)
Ex1_batch()
function Ex1_batch()
    imagefiles = dir('*.jpg');
    nfiles = length(imagefiles);
    for index=1:nfiles
        currentfilename = imagefiles(index).name;
        currentimage = imread(currentfilename);
        result = Process(currentimage);
        resultfile_name = strcat(extractBetween(currentfilename,"",".jpg"), '.bmp')
        imwrite(result,char(resultfile_name),'bmp')
    end
end

% 2.c
function result = Process(x)
    scale_down = imresize(x, 0.75);
    imgsize = size(scale_down);
    right_half = scale_down(:, imgsize(2)/2+1 : end, : );
    left_half = fliplr(right_half);
%     mirrored = [left_half right_half];
    result = imrotate(left_half,90);
end

