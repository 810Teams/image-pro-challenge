f = imread('Fig0923(a)(aerial).tif');
se = strel('square', 3);
gd = imdilate(f, se);
ge = imerode(f, se);
morph_grad = imsubtract(gd, ge);
figure(1); imshow(f);
figure(2); imshow(gd);
figure(3); imshow(ge);
figure(4); imshow(morph_grad);