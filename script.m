%
% script.m
%

clear all;
close all;

for i = 1:7
    image = imread(sprintf('img/%d.jpg', i));
    ocrResults = ocr(image);

    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    if ~isempty(position)
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label);
        figure(i), imshow(Iocr);
    end
end