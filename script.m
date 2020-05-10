%
% script.m
%

clear all;
close all;

for i = 1:7
    image = imread(sprintf('img/%d.jpg', i));
    processed = preprocess(image);
    ocrResults = ocr(processed);

    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    if ~isempty(position)
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label);
        figure(i);
        subplot(1, 2, 1), imshow(processed);
        subplot(1, 2, 2), imshow(Iocr);
    end
end