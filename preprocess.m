%
% preprocess.m
%

function [processed] = preprocess(image)
    processed = rgb2gray(image);
    processed = medfilt2(processed, [3 3], 'symmetric');
    
end
