%%
% 1.a
I = imread('DIP.jpg');
[row,col] = size(I);

[u, v] = meshgrid(-row/2:row/2-1, -col/2:col/2-1);

T=1;
a=0.1;
b=0.1;
r=(-1)^.5;
H = T./(pi*(u*a+v*b)+0.0001).*sin(pi*(u*a+v*b)).*exp(-j*pi*(u*a+v*b));


F = (fft2(double(I)));
Fc = fftshift(F);
G = H.*Fc;
gi = real(ifft2(ifftshift(G)));
% g = real(ifft2(G));

% 1.c
F1 = (fft2(double(gi)));
Fc1 = fftshift(F1);
I_filt = Fc1./(H+0.001);
gi1 = real(ifft2(ifftshift(I_filt)));
% I_filt = G.*H; to invert filter H you do I_filt = G./(H+0.001), where G is the image in frequency domain

subplot(3,3,1);imshow(I); title('Original'); 
subplot(3,3,2);imshow(gi, []);title('Degraded Image by motion');
subplot(3,3,3);imshow(gi1, []);title('Degraded Image by motion');
% 1.d
ERR = immse(double(I),gi); 
ERR2 = immse(double(I),gi1); 
%%
% 2.a
[row,col] = size(gi);
noise = 5^.5*randn(row,col);
gi_noise = gi + noise;
% figure;imshow(gi_noise,[]); 
% 2.b
F2 = fft2(gi_noise);
Fc2 = fftshift(F2);
I_filt2 = Fc2./(H+0.001);
gi2 = real(ifft2(ifftshift(I_filt2)));
% figure;imshow(gi2,[]);
% 2.c
f_noise = fft2(noise);
fc_noise = fftshift(f_noise);
f_image =fft2(gi);
fc_image =fftshift(f_image);
% SNR = fc_noise/fc_image;

H2 = conj(H).*H;
k = abs(fc_noise).^2./abs(fc_image).^2;
wiener_filter = (1./(H+0.001)).*((H2)./(H2+0.0000001));


% wiener_filter = (1./H+0.0001)* conj(H).*H /((conj(H).*H + 0.00001)+(abs(fc_noise)/abs(fc_image + 0.0001)));
F3 = fft2(gi2);
Fc3 = fftshift(F3);
G3 = wiener_filter.*Fc3;
gi3 = real(ifft2(ifftshift(G3)));
% g = real(ifft2(G));
% figure;imshow(gi3,[]);


 subplot(3,3,1);imshow(gi_noise, []); title('noise added'); 
 subplot(3,3,2);imshow(gi2, []);title('inverse filter');
 subplot(3,3,3);imshow(gi3, []); title('wiener filter'); 

%  2.f
% When the value of k is small they cannot filter the DIP image. 



