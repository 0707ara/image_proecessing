% 1.a
I = imread('wom1.PNG');
% A = zeros(1,256,'uint8');
A = zeros(1,256);
file_length = size(I);

for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(I(row_index,col_index)-1) =  A(I(row_index,col_index)-1)+ 1;
    end
end
bar(A)

% 1.c
I = imread('man8.PNG');
I2 = imread('wom1.PNG');
enhanced_I = ContrastStretch(I);
enhanced_I2 = ContrastStretch(I2);
A = zeros(1,256);
file_length = size(I);

for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(enhanced_I(row_index,col_index)-1) =  A(enhanced_I(row_index,col_index)-1)+ 1;
    end
end
bar(A)

for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(enhanced_I2(row_index,col_index)-1) =  A(enhanced_I2(row_index,col_index)-1)+ 1;
    end
end
bar(A)

function result = ContrastStretch(x)
a = min(x(:)); 
b = max(x(:)); 
result = (x-a).*(255/(b-a));
end

% 1.c
% I = imread('man8.PNG');
% I2 = imread('wom1.PNG');
% enhanced_I = ContrastStretch(I);
% enhanced_I2 = ContrastStretch(I2);


% mininum = min(x);
% maximum = max(x);
% first_index = 0;
% last_index = 0;
% valid = true;
% 
% for index=1:length(x)-1
%     if x(index) == 0 && x(index+1) ~= 0 && valid == true 
%         first_index = index;
%         valid = false;
%     elseif x(index) ~= 0 && x(index+1) == 0
%         last_index = index;
%     end
% end
% result = (x - x(first_index))*((maximum - mininum)/x(last_index)-x(first_index)) + mininum