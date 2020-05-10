%
% preprocess.m
%

function [g] = preprocess5(f)
    g = rgb2gray(f);
    
    % -- Weiner --
    % https://www.mathworks.com/help/images/ref/deconvwnr.html
    I = im2double(g);
    
    PSF = fspecial('gaussian', 3);
   
    noise_var = 0.0001;
    
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
end
