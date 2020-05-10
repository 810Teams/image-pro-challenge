%
% script.m
%

clear all;
close all;

for i = 1:7
    image = imread(sprintf('img/%d.jpg', i));
    
    if i == 5
        processed = preprocess5(image);
    elseif i == 6
        processed = preprocess6(image);
    elseif i == 7
        processed = preprocess7(image);
    else
        processed = preprocess5(image);
    end
    
    ocrResults = ocr(processed);
  
    ocrResults.Text

    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    figure(i);
    if ~isempty(position)
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label);
        
        subplot(1, 2, 1), imshow(processed);
        subplot(1, 2, 2), imshow(Iocr);
    else
        imshow(processed);
    end
end