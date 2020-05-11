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
    ocrResults = ocr(processed);
    
    ocrResults.Words

    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    figure(i);
    if ~isempty(position)
        image = imresize(image, R1);
        image = imresize(image, R2);
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label);
        
        subplot(1, 2, 1), imshow(processed);
        subplot(1, 2, 2), imshow(Iocr);
    else
        imshow(processed);
    end
end