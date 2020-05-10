f = imread('Fig0913(a)(small-squares).tif');
figure(1); imshow(f);

B1 = strel([0 0 0; 0 1 1; 0 1 0]);
B2 = strel([1 1 1; 1 0 0; 1 0 0]);
g = bwhitmiss(f, B1, B2);
figure(2); imshow(g, []);