%%
% 1.a
% row * col = 230,400
% Only yy is corespoding to size the given rows and cols.
% uu and vv is half size of yy.

% 1.b
uu_reshape = reshape(uu,[cols/2,rows/2]);
vv_reshape = reshape(vv,[cols/2,rows/2]);
yy_reshape = reshape(yy,[cols, rows]);

uu_resize = imresize(uu_reshape, [cols rows]);
vv_resize = imresize(vv_reshape, [cols rows]);

subplot(1,3,1),imshow(uu_resize, []);
subplot(1,3,2),imshow(vv_resize, []);
subplot(1,3,3),imshow(yy_reshape, []);
% subplot(1,3,1),imshow(uint8(uu_reshape));
% subplot(1,3,2),imshow(uint8(vv_reshape));
% subplot(1,3,3),imshow(uint8(yy_reshape));

% 1.c
uu_centred = uu_resize - double(127);
vv_centred = vv_resize - double(127);
% yy_centred = uint8(yy_reshape - double(127));

% 1.d
V = vv_centred(:);
U = uu_centred(:);
Y = yy_reshape(:);

% 1.e
% Concatenate row-wise is not
YUV = cat(2,Y,U,V);
% YUV = cat(1,Y,U,V);
% YUV2 = reshape(YUV,[cols, rows, 3]);
YuvToRgb = [ 1 0 1.402;
             1 -0.34413 -0.71414;
             1 1.772 0];

RGB=YuvToRgb*double(YUV)';

RGB_result = reshape(RGB,[rows, cols, 3]);
% 1.f
RGB_result(:,:,1) = reshape(RGB(1,:),[cols, rows])';
RGB_result(:,:,2) = reshape(RGB(2,:),[cols, rows])';
RGB_result(:,:,3) = reshape(RGB(3,:),[cols, rows])';
figure, imshow(uint8(RGB_result));
figure, imshow(RGB,[]);
%%
% 2.a
I = imread('lena.tiff');
I_Y = rgb2ycbcr(I);

subplot(1,3,1),imshow(I_Y(:,:,1), []);
subplot(1,3,2),imshow(I_Y(:,:,2), []);
subplot(1,3,3),imshow(I_Y(:,:,3), []);
% 2.b
%%
% Downsampling
%  4:4:4 to 4:2:2, I_Y(:,:,1), []);
%  I did not shrink the layer. What should i do?


I_Y_1 = I_Y;
I_Y_2 = I_Y;
I_Y_3 = I_Y;
I_Y_4 = I_Y;

%4:2:2
I_Y_1(:, 2:2:end,2) = I_Y_1(:, 1:2:end-1,2);
I_Y_1(:, 2:2:end,3) = I_Y_1(:, 1:2:end-1,3);

%4:1:1
I_Y_2(:, 2:2:end,2) = I_Y_2(:, 1:2:end-1,2);
I_Y_2(:, 2:2:end,3) = I_Y_2(:, 1:2:end-1,3);

I_Y_2(:, 3:3:end,2) = I_Y_2(:, 1:3:end-2,2);
I_Y_2(:, 3:3:end,3) = I_Y_2(:, 1:3:end-2,3);

%4:2:0
I_Y_3(:, 2:2:end,2) = I_Y_3(:, 1:2:end-1,2);
I_Y_3(:, 2:2:end,3) = I_Y_3(:, 1:2:end-1,3);
I_Y_3(2:2:end, :,2) = I_Y_3(1:2:end-1, :, 2);
I_Y_3(2:2:end, :,3) = I_Y_3(1:2:end-1, :, 3);

%4:1:1 luminance component downsampling
I_Y_4(:, 2:2:end,1) = I_Y_4(:, 1:2:end-1,1);
I_Y_4(:, 3:3:end,1) = I_Y_4(:, 1:3:end-2,1);

% Changing to RGB
I_Y_1rgb = ycbcr2rgb(I_Y_1);
I_Y_2rgb = ycbcr2rgb(I_Y_2);
I_Y_3rgb = ycbcr2rgb(I_Y_3);
I_Y_4rgb = ycbcr2rgb(I_Y_4);

% Plotting ycbcr, rgb images
subplot(2,4,1),imshow(I_Y_1, []);
subplot(2,4,2),imshow(I_Y_2, []);
subplot(2,4,3),imshow(I_Y_3, []);
subplot(2,4,4),imshow(I_Y_4, []);
subplot(2,4,5),imshow(I_Y_1rgb, []);
subplot(2,4,6),imshow(I_Y_2rgb, []);
subplot(2,4,7),imshow(I_Y_3rgb, []);
subplot(2,4,8),imshow(I_Y_4rgb, []);

%%
% Upsampling

% 2.c Not really difference in when you down sampling cb cr components, 
% However when you downsample the luminance component, you can see the big
% difference. 

% 2.d
% The error of each image is going bigger. When you downsample the
% luminance component, the mse is the biggest and the difference is very
% visible. 
err1 = immse(I, I_Y_1rgb);
err2 = immse(I, I_Y_2rgb);
err3 = immse(I, I_Y_3rgb);
err4 = immse(I, I_Y_4rgb);



































