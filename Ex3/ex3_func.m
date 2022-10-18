
I = imread('man8.PNG');
I2 = imread('wom1.PNG');
enhanced_I = ContrastStretch(I);
enhanced_I2 = ContrastStretch(I2);
figure, imshow(I);
figure, imshow(I2);
figure, imshow(enhanced_I);
figure, imshow(enhanced_I2);
A = zeros(1,256);
file_length = size(I);
for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(I(row_index,col_index)+1) =  A(I(row_index,col_index)+1)+ 1;
    end
end
bar(A)

for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(enhanced_I(row_index,col_index)+1) =  A(enhanced_I(row_index,col_index)+1)+ 1;
    end
end
bar(A)

for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(I2(row_index,col_index)+1) =  A(I2(row_index,col_index)+1)+ 1;
    end
end
bar(A)

for row_index=1:file_length(1)
    for col_index=1:file_length(2)            
         A(enhanced_I2(row_index,col_index)+1) =  A(enhanced_I2(row_index,col_index)+1)+ 1;
    end
end
bar(A)

function result = ContrastStretch(x)
a = min(x(:)); 
b = max(x(:)); 
result = (x-a).*(255/(b-a));
end