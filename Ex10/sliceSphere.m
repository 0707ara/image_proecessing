function I_Smask = sliceSphere(I, dist)
P = impixel(I);
[row, col, dim] = size(I);
I_Smask = zeros(size(I));
I = double(I);

for r = 1:row-1
    for c = 1:col-1
        if norm(P(1,1)-I(r,c,1)).^2 + norm(P(1,2)-I(r,c,1)).^2 + norm(P(1,3)-I(r,c,1)).^2 <= dist.^2
            I_Smask(r,c,:)=1;
        end
    end
end

