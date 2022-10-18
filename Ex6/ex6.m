%%
% 1.a
I = ones(128)*0.5;
[row, col] = size(I);
% 1.b
I_square = I;
I_square(row/2-10:row/2+10-1, col/2-10:col/2+10-1) = ones(20,20);
% 1.c
I_ramp = repmat([0:1/127:1]',1,128);
% 1.d
I_delta = I;
I_delta(row/2, col/2) = 1;
% 1.e 
x = 0:1:127;
y = cos(2*pi*x/32);
plot(x,y);
[X,Y] = meshgrid(y,y);
I_mesh = (X+Y)/2;
%figure, imshow(I_mesh);
%plot(X,Y);
%surf(X,Y);
%s = mesh(X,Y)
%s = mesh(X,Y,'FaceAlpha','0.5')
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.a
F = fft2(I);
%figure, imshow(I);
%figure, imshow(log(abs(fftshift(F))) + 0.0001);

%figure, imshow(log(abs(F)) + 0.0001);
F_square = fft2(I_square);
%figure, imshow(log(abs(F_square)) + 0.0001);
F_ramp = fft2(I_ramp);
%figure, imshow(log(abs(F_ramp)) + 0.0001);
F_delta = fft2(I_delta);
%figure, imshow(log(abs(F_delta)) + 0.0001);
F_mesh = fft2(I_mesh);
%figure, imshow(log(abs(F_mesh)) + 0.0001);
subplot(2,5,1),imshow(I);subplot(2,5,2),imshow(I_square);subplot(2,5,3),imshow(I_ramp);subplot(2,5,4),imshow(I_delta);subplot(2,5,5),imshow(I_mesh);
subplot(2,5,6),imshow(log(abs(fftshift(F)))+0.0001);
subplot(2,5,7),imshow(log(abs(fftshift(F_square))) + 0.0001);
subplot(2,5,8),imshow(log(abs(fftshift(F_ramp))) + 0.0001);
subplot(2,5,9),imshow(log(abs(fftshift(F_delta))) + 0.0001);
subplot(2,5,10),imshow(log(abs(fftshift(F_mesh))) + 0.0001);

%%
% 2.b Explain what information you get from Fourier transform of an image.
% Dominant direction of the image flow. Usually vertically and
% horizontally. 
% 2.c Where is the energy concentrated and why?
% Energy is concentrated where the values are high before the fourier
% transform. 
% Fourier transform of an image
% 3.a 3.b
I = imread('cameraman.tif');
BWLP_result1 = BWLPfilter(I,20,2);
BWHP_result1 = 1-BWLPfilter(I,20,2);

iF = fft2(double(I));
iFc = fftshift(iF);

BWLP_result = BWLP_result1.*iFc;
BWHP_result = BWHP_result1.*iFc;
gi_bwlp = ifft2(ifftshift(BWLP_result));
gi_bwhp = ifft2(ifftshift(BWHP_result));
g_lp = real(gi_bwlp);
g_hp = real(gi_bwhp);

subplot(2,3,1),imshow(I);
subplot(2,3,2),imshow(BWLP_result1);
subplot(2,3,3),imshow(BWHP_result1);


figure,colormap('gray'),imagesc(g_lp);
figure,colormap('gray'),imagesc(g_hp);

% use colourmap to show image
