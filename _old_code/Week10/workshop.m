f = imread('Fig0906(a)(broken-text).tif');
se1 = [0 0 0; 0 0 0; 1 1 1];
se2 = [0 0 1; 0 0 1; 0 0 1];
se3 = [1 0 1; 1 0 1; 1 0 1];

di1 = imdilate(f, se1);
di2 = imdilate(f, se2);
di3 = imdilate(f, se3);

figure(1);
subplot(1, 3, 1), imshow(di1);
subplot(1, 3, 2), imshow(di2);
subplot(1, 3, 3), imshow(di3);

er1 = imerode(f, se1);
er2 = imerode(f, se2);
er3 = imerode(f, se3);

figure(2);
subplot(1, 3, 1), imshow(er1);
subplot(1, 3, 2), imshow(er2);
subplot(1, 3, 3), imshow(er3);

op1 = imopen(f, se1);
op2 = imopen(f, se2);
op3 = imopen(f, se3);

figure(3);
subplot(1, 3, 1), imshow(op1);
subplot(1, 3, 2), imshow(op2);
subplot(1, 3, 3), imshow(op3);

cl1 = imclose(f, se1);
cl2 = imclose(f, se2);
cl3 = imclose(f, se3);

figure(4);
subplot(1, 3, 1), imshow(cl1);
subplot(1, 3, 2), imshow(cl2);
subplot(1, 3, 3), imshow(cl3);