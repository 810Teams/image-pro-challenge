%
% preprocess.m
%

function [g] = preprocess(f)
    g = rgb2gray(f);
    
    g = imresize(g, 1.1);
    
    % -- Weiner --
    % https://www.mathworks.com/help/images/ref/deconvwnr.html
    I = im2double(g);
    PSF = fspecial('motion', 1.02, 0);
    noise_var = 0.0001;
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
    
    I = im2double(g);
    PSF = fspecial('motion', 1.02, 22.5);
    noise_var = 0.0001;
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
    
    I = im2double(g);
    PSF = fspecial('motion', 1.02, 45);
    noise_var = 0.0001;
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
    
    I = im2double(g);
    PSF = fspecial('motion', 1.02, 67.5);
    noise_var = 0.0001;
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
    
    I = im2double(g);
    PSF = fspecial('motion', 1.02, 90);
    noise_var = 0.0001;
    estimated_nsr = noise_var / var(I(:));
    g = deconvwnr(g, PSF, estimated_nsr);
    
    g = imresize(g, 1.6);
end


























