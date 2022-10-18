%%
I = imread('cheetah.jpg');
dist = 100;

I_c = sliceCube(I, dist);
I_s = sliceSphere(I, dist);
I = double(I);
I_c1 = I.* I_c;
I_s1 = I.* I_s;
subplot(3,2,1);imshow(uint8(I)); title('original image');
subplot(3,2,2);imshow(I_c1,[]); title('slicecube'); 
subplot(3,2,3);imshow(I_s1,[]);title('sliceSphere');

%%
% 2.a
I3 = imread('lena.tiff');
I3_hsi = rgb2hsi(I3);
subplot(2,3,1);imshow(I3(:,:,1),[]); title('R'); 
subplot(2,3,2);imshow(I3(:,:,2),[]);title('G');
subplot(2,3,3);imshow(I3(:,:,3),[]);title('G');
subplot(2,3,4);imshow(I3_hsi(:,:,1),[]);title('H');
subplot(2,3,5);imshow(I3_hsi(:,:,2),[]);title('S');
subplot(2,3,6);imshow(I3_hsi(:,:,3),[]);title('I');
%%
% 2.b
% Component H, S are mostly effected. 
% The colour has changed with the noise. Therefor Hue and saturation is mostly effected.
% The noise doesn't change the intensity much compare to other component.

I3_noise = I3;
I3_noise(:,:,2) = imnoise(I3_noise(:,:,2),'gaussian');
I3_noise_hsi = rgb2hsi(I3_noise);
subplot(2,3,1);imshow(I3_noise(:,:,1),[]); title('R'); 
subplot(2,3,2);imshow(I3_noise(:,:,2),[]);title('G');
subplot(2,3,3);imshow(I3_noise(:,:,3),[]);title('B');
subplot(2,3,4);imshow(I3_noise_hsi(:,:,1),[]);title('H');
subplot(2,3,5);imshow(I3_noise_hsi(:,:,2),[]);title('S');
subplot(2,3,6);imshow(I3_noise_hsi(:,:,3),[]);title('I');

%%
% 2.c
% More noise on H S small noise on I 
% The colour has changed with the noise. Therefor Hue and saturation is mostly effected.
% The noise doesn't change the intensity much compare to other component.
I3_noise_a = I3;
I3_noise_a = imnoise(I3,'gaussian');
I3_noise_a_hsi = rgb2hsi(I3_noise_a);
subplot(2,3,1);imshow(I3_noise_a(:,:,1),[]); title('R'); 
subplot(2,3,2);imshow(I3_noise_a(:,:,2),[]);title('G');
subplot(2,3,3);imshow(I3_noise_a(:,:,3),[]);title('B');
subplot(2,3,4);imshow(I3_noise_a_hsi(:,:,1),[]);title('H');
subplot(2,3,5);imshow(I3_noise_a_hsi(:,:,2),[]);title('S');
subplot(2,3,6);imshow(I3_noise_a_hsi(:,:,3),[]);title('I');

%%
% 2.d
% The result: The colour of the HSI filtered image is devastated. 
% I > gets brighter when you apply mean with noise , S > gets higher with noise. H > gets higher value results  
% Intensity filtered you dont change RGB values that much. 

I3_noise_a = I3;
I3_noise_a = imnoise(I3,'gaussian');
I3_noise_a_hsi = rgb2hsi(I3_noise_a);

I3_noise_f = imfilter(I3_noise_a,fspecial('average'));
I3_noise_f_hsi = rgb2hsi(I3_noise_f);
I3_noise_f_hsi_h = I3_noise_f_hsi;
I3_noise_f_hsi_s = I3_noise_f_hsi;
I3_noise_f_hsi_i = I3_noise_f_hsi;
I3_noise_f_hsi_h(:,:,1) = imfilter(I3_noise_f_hsi_h(:,:,1),fspecial('average'));
I3_noise_f_hsi_s(:,:,2) = imfilter(I3_noise_f_hsi_s(:,:,2),fspecial('average'));
I3_noise_f_hsi_i(:,:,3) = imfilter(I3_noise_f_hsi_i(:,:,3),fspecial('average'));

subplot(4,4,1);imshow(I3_noise_a(:,:,1),[]); title('R'); 
subplot(4,4,2);imshow(I3_noise_a(:,:,2),[]);title('G');
subplot(4,4,3);imshow(I3_noise_a(:,:,3),[]);title('G');
subplot(4,4,4);imshow(I3_noise_a_hsi(:,:,1),[]);title('H');
subplot(4,4,5);imshow(I3_noise_a_hsi(:,:,2),[]);title('S');
subplot(4,4,6);imshow(I3_noise_a_hsi(:,:,3),[]);title('I');
subplot(4,4,7);imshow(I3_noise_f(:,:,1),[]); title('R_filtered'); 
subplot(4,4,8);imshow(I3_noise_f(:,:,2),[]);title('G_filtered');
subplot(4,4,9);imshow(I3_noise_f(:,:,3),[]);title('G_filtered');
subplot(4,4,10);imshow(I3_noise_f_hsi(:,:,1),[]);title('H_filtered');
subplot(4,4,11);imshow(I3_noise_f_hsi(:,:,2),[]);title('S_filtered');
subplot(4,4,12);imshow(I3_noise_f_hsi(:,:,3),[]);title('I_filtered');
subplot(4,4,13);imshow(I3_noise_f_hsi_h,[]);title('I_filtered');
subplot(4,4,14);imshow(I3_noise_f_hsi_s,[]);title('I_filtered');
subplot(4,4,15);imshow(I3_noise_f_hsi_i,[]);title('I_filtered');