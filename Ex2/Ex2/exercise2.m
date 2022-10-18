% 1.b
A=(0:255)
% 1.c
step = 256/4; 
QA1 = quant(A, step); % Returns values from X rounded to nearest multiple of Q.
partition = step:step:256-step; %start : increment : endpoint 64:64:192
codebook = step/2:step:256-step/2; %start : increment : endpoint 32:64:224
[index,QA2] = quantiz(A, partition, codebook);% [index,quants] = quantiz(sig,partition,codebook)
%  Specifies codebook, which prescribes a value for each partition in the scalar quantization. codebook is a vector whose length must exceed the length of partition by one. The function also returns quants, which contains the scalar quantization of sig and depends on the quantization levels and prescribed values in the codebook

% 2.a
I = imread('lena_face.png')
I_size = size(I)
% 2.b
% Using quantiz function, design 128, 64, 32, 16, 8 and 4-level uniform quantizers and quantize the gray-level image
% 128 level 
A = reshape(I, 1, []);
step = 256/128; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));
figure, imshow(I2);


% 64 level 
A = reshape(I, 1, []);
step = 256/64; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));
% 32 level 
A = reshape(I, 1, []);
step = 256/32; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));

% 16 level 
A = reshape(I, 1, []);
step = 256/16; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));
figure, imshow(I2);
% 8 level 
step = 256/8; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));
figure, imshow(I2);

% 2.c add noise
A = reshape(I, 1, []);
B = A + randi(100,1,65536,'uint8');
step = 256/16; 
QA1 = quant(B, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(B, partition, codebook);
I3 = uint8(reshape(QA2,I_size));
figure, imshow(I3);
A = reshape(I, 1, []);
step = 256/16; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));
figure, imshow(I2);

% 
A = reshape(I, 1, []);
step = 256/16; 
QA1 = quant(A, step); 
partition = step:step:256-step; 
codebook = step/2:step:256-step/2; 
[indx,QA2] = quantiz(A, partition, codebook);
I2 = uint8(reshape(QA2,I_size));
figure, imshow(I2);

% 3.a
I1 = uint8(zeros(400,400));
I2 = uint8(zeros(400,400));
I1(1:400,1:400) = 63;
I2(1:400,1:400) = 223;
I1(120:280,120:280) = 127;
I2(120:280,120:280) = 127;

% I1(120:280,120:280) = 71; Looks similar each other.
test = 0;

while test == 0
    %while the small square looks smilar to each other do the while loop
    input_value = input('Enter 1 for brightening 2 for darkening 0 for exit')
    if input_value == 1
        %if input is 1 brighten up the I1 small square value
        I1(120:280,120:280) = I1(121,121)+1;
        subplot(1,2,1), imshow(I1)
        subplot(1,2,2), imshow(I2)
    elseif input_value == 2
        %if input is 2 darken the I1 small square value
        I1(120:280,120:280) = I1(121,121)-1;
        subplot(1,2,1), imshow(I1)
        subplot(1,2,2), imshow(I2)
    elseif input_value == 0
         %if input is 0 exit the while loop
        test = 1
        disp('Value is'+I1(121,121))
    else
        disp('please enter either 0,1,2')
    end    
end