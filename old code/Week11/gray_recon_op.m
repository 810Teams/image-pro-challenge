close all

f = imread('Fig0925(a)(dowels).tif');
se = strel('disk', 5);

fe = imerode(f, se);
fobr = imreconstruct(fe, f);

fobrc = imcomplement(fobr);
fobrce = imerode(fobrc, se);
fobrcer = imcomplement(imreconstruct(fobrce, fobrc));

figure, imshow(f);
figure, imshow(fe);
figure, imshow(fobr);
figure, imshow(fobrcer);