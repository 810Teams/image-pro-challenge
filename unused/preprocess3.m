rng default;
f = imread('3.jpg');
f = im2double(rgb2gray(f));
LEN = 14;
THETA = 20;
SD = 0.05;
PSF = fspecial('motion', LEN, THETA);
INITPSF = ones(size(PSF));
NUMIT = 100;
DAMPAR = 10*SD;
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(f));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
[j, psfr] = deconvblind(f, INITPSF, NUMIT, DAMPAR, WEIGHT);
figure,
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(PSF, []);
subplot(2, 2, 3); imshow(j);
subplot(2, 2, 4); imshow(psfr, []);
f_obr = imreconstruct(imerode(f, ones(80, 750)), f);
f_thr = imsubtract(f, f_obr);
g_obr = imreconstruct(imerode(f_thr, ones(70, 7)), f_thr);
g_obrd = imdilate(g_obr, ones(1, 15));
f2 = imreconstruct(min(g_obrd, f_thr), f_thr);
figure, imshow(f2);
imwrite(f2, 'test.tif');
increasecont2 = imadjust(f2, [0.7 1], [0 1]);
figure, imshow(increasecont2);
ocrresult2 = ocr(increasecont2);
text2 = ocrresult2.Text
ocrresult2
Iocr = insertObjectAnnotation(f, 'rectangle', ocrresult2.WordBoundingBoxes, ocrresult2.WordConfidences);
figure, imshow(Iocr);