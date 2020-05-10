%
% script.m
%

clear all;
close all;

for i = 1:7
    image = imread(sprintf('img/%d.jpg', i));
    
    processed = preprocess(image);
    
    ocrResults = ocr(processed);
  
    ocrResults.Words

    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    figure(i);
    if ~isempty(position)
        image = imresize(image, 1.1);
        image = imresize(image, 1.6);
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label);
        
        subplot(1, 2, 1), imshow(processed, []);
        subplot(1, 2, 2), imshow(Iocr);
    else
        imshow(processed);
    end
end