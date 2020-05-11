%
% preprocess.m
%

function [g] = preprocess(f, r1, r2)
    % -- Initialize --
    g = rgb2gray(f);
    g = imresize(g, r1);
    
    % -- Weiner --
    % https://www.mathworks.com/help/images/ref/deconvwnr.html
    ANGLES = 12;
    for i = 0:ANGLES - 1
        I = im2double(g);
        PSF = fspecial('motion', 1.015, 90 - 90/ANGLES*i);
        noise_var = 0.0001;
        estimated_nsr = noise_var / var(I(:));
        g = deconvwnr(g, PSF, estimated_nsr);
    end
    
    % -- Final --
    g = imresize(g, r2);
    
    % -- Noise Removal --
    % g = filter2(fspecial('average',3), g)/255;
    % g = medfilt2(g);
end


























