f = imread('Fig0925(a)(dowels).tif');
fasf = f;
for k = 2:5
    se = strel('disk', k);
    fasf = imclose(imopen(fasf, se), se);
end
figure(), imshow(fasf);