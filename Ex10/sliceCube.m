function I_Cmask = sliceCube(I, dist)
P = impixel(I);
[row, col, dim] = size(I);
I_Cmask = zeros(size(I));
I = double(I);

for r = 1:row-1
    for c = 1:col-1
        if abs(P(1,1)-I(r,c,1))+abs(P(1,2)-I(r,c,2))+abs(P(1,3)-I(r,c,3)) <= dist
            I_Cmask(r,c,:)=1;
        end
    end
end

