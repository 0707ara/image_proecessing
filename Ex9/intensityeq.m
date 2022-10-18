function I_hsv_eq = intensityeq(I)
    I_hsv = rgb2hsv(I);

    V = I_hsv(:,:,3);
    V = histeq(V);

    I_hsv(:,:,3) = V;

    I_hsv_eq = hsv2rgb(I_hsv);
end