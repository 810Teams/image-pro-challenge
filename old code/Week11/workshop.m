clear all
close all

f = imread('Fig0930(a)(calculator).tif');
f_obr = imreconstruct(imerode(f, ones(1, 71)), f);
figure(),
subplot(2, 3, 1), imshow(f);
subplot(2, 3, 2), imshow(f_obr);

f_thr = imsubtract(f, f_obr);
subplot(2, 3, 3), imshow(f_thr);

g_obr = imreconstruct(imerode(f_thr, ones(1, 12)), f_thr);
subplot(2, 3, 4), imshow(g_obr);

g_obrd = imdilate(g_obr, ones(1, 15));
f2 = imreconstruct(min(g_obrd, f_thr), f_thr);
subplot(2, 3, 5), imshow(f2);
figure(), imshow(f2);

