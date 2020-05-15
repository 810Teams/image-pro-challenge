%
% script.m
%
% Steps:
%  - Read image
%  - Preprocess image
%  - Apply ocr function on preprocessed image
%  - Display bounding boxes on original image
%

% -- Clear and close all -- %
clear all;
close all;

% -- Global Variables -- %
R1 = 1.1; % Resize before preprocessing
R2 = 1.6; % Resize after preprocessed

% -- Loop per Image -- %
for i = 1:7
    % -- Initialization -- %
    image = imread(sprintf('img/%d.jpg', i)); % Read image
    preprocessed = preprocess(image, R1, R2); % Preprocess image
    ocrResults = ocr(preprocessed);           % Apply ocr function on preprocessed image
    
    % -- Recognized Words Displaying -- %
    ocrResults.Words
    
    % -- Positions and Labels Retrieval -- %
    position = ocrResults.WordBoundingBoxes;
    label =  ocrResults.WordConfidences;
    
    % -- Image Displaying -- %
    figure(i);
    if ~isempty(position)
        % -- Normal Case: Text detected, having at least one bounding box -- %
        image = imresize(imresize(image, R1), R2);                          % Resize original image
        Iocr = insertObjectAnnotation(image, 'rectangle', position, label); % Insert bounding boxes to the original image
        
        subplot(1, 2, 1), imshow(preprocessed); % Display preprocessed image
        subplot(1, 2, 2), imshow(Iocr);         % Display original image with bounding boxes inserted
    else
        % -- Failed Case: No text detected, no bounding boxes -- %
        imshow(preprocessed); % Display preprocessed image alone
    end
end