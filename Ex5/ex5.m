% 5.1
I=imread('cameraman.tif');
% subplot(2, 2, 1);imshow(I, []);
laplacianKernel1 = [-1,-1,-1;-1,8,-1;-1,-1,-1]/8;
laplacianKernel2 = [-1,-1,-1;-1,9,-1;-1,-1,-1]/8;
laplacianKernel3 = [-1,-1,-1;-1,9.7,-1;-1,-1,-1]/8;
laplacianImage1 = imfilter(double(I), laplacianKernel);
laplacianImage2 = imfilter(double(I), laplacianKerne2);
laplacianImage3 = imfilter(double(I), laplacianKerne3);
subplot(2, 2, 1),imshow(I);
subplot(2, 2, 2),imshow(uint8(laplacianImage1));
subplot(2, 2, 3),imshow(uint8(laplacianImage2));
subplot(2, 2, 4),imshow(uint8(laplacianImage3));
% title('Laplacian Image', 'FontSize', fontSize);
% 5.2.a
% I_noise = I + randi(20,256,'uint8');
I_noise = I + uint8(randn(size(I))*10);
subplot(2, 2, 1),imshow(I);
subplot(2, 2, 2),imshow(uint8(I_noise));
%  5.2.b
%  ex5_2
%  5.2.c
%  By using mean value
% 5.3.a
I=imread('miranda1.tif');
[row, col] = size(I);
I_noise = I;
I_noise(row/2-50:row/2+50-1, col/2-50:col/2+50-1) = I_noise(row/2-50:row/2+50-1, col/2-50:col/2+50-1) + randi(10,100,'uint8')
% 5.3.b
% with diff angles better noise canceling





