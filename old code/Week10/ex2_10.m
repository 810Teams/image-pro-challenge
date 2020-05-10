A = imread('Fig0906(a)(broken-text).tif');
B = [0 1 0; 1 1 1; 0 1 0];

A2 = imdilate(A, B);
figure;
subplot(1, 2, 1), imshow(A);
subplot(1, 2, 2), imshow(A2);