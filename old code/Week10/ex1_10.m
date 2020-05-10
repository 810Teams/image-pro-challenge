utk = imread('Fig0903(a)(utk).tif');
gt = imread('Fig0903(b)(gt).tif');
figure;
subplot(2, 3, 1), imshow(utk);
subplot(2, 3, 2), imshow(gt);

comp_utk = ~utk;
subplot(2, 3, 3), imshow(comp_utk);

AorB = utk | gt;
AandB = utk & gt;
AanddifB = utk & ~gt;
subplot(2, 3, 4), imshow(AorB);
subplot(2, 3, 5), imshow(AandB);
subplot(2, 3, 6), imshow(AanddifB);