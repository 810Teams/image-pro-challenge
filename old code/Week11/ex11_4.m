f = imread('Fig0925(a)(dowels).tif');
se = strel('disk', 5);
fo = imopen(f, se);
foc = imclose(fo, se);
figure, imshow(f);
figure, imshow(fo);
figure, imshow(foc);