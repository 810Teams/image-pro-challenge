%
% script.m
%

clear all;
close all;

% -- Global Variables --
R1 = 1.1; % Resize before preprocessing
R2 = 1.6; % Resize after preprocessed

for i = 1:7
    image = imread(sprintf('img/%d.jpg', i));
    processed = preprocess(image, R1, R2);
    f_obr = imreconstruct(imerode(processed, ones(50, 71)), processed);
    f_thr = imsubtract(processed, f_obr);
    g_obr = imreconstruct(imerode(f_thr, ones(1, 12)), f_thr);
    g_obrd = imdilate(g_obr, ones(1, 15));
    f2 = imreconstruct(min(g_obrd, f_thr), f_thr);
    ocrResults = ocr(f2);
    
    ocrResults.Words

    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    figure(i);
    if ~isempty(position)
        image = imresize(image, R1);
        image = imresize(image, R2);
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label);
        
        subplot(1, 2, 1), imshow(f2);
        subplot(1, 2, 2), imshow(Iocr);
    else
        subplot(2, 2, 1), imshow(processed);
        subplot(2, 2, 2), imshow(f_thr);
        subplot(2, 2, 3), imshow(g_obr);
        subplot(2, 2, 4), imshow(g_obrd);
    end
end