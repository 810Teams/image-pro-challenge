%
% preprocess7.m
% Status: Not working
%

function [g] = preprocess7(f)
    g = rgb2gray(f);
    
    % -- Weiner --
    % https://www.mathworks.com/help/images/ref/deconvwnr.html
    I = im2double(g);
    
    LEN = 1.5;
    THETA = 20;
    PSF = fspecial('gaussian', 3); %fspecial('motion', LEN, THETA);
   
    noise_var = 0.0001;
    
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
end
