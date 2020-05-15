%
% preprocess.m
%
% Steps:
%  - Retrieve image
%  - Convert to grayscale
%  - Resize with r1 scale (1.1)
%  - Apply Weiner Filter 12 times (len = 1.015) on different angles (0 to 90 degrees)
%  - Resize with 22 scale (1.6)
%

function [g] = preprocess(f, r1, r2)
    % -- Initialization -- %
    g = rgb2gray(f);     % Convert to grayscale
    g = imresize(g, r1); % Resize with r1 scale (1.1)
    
    % -- Weiner Filter -- %
    % https://www.mathworks.com/help/images/ref/deconvwnr.html
    ANGLES = 12;
    for i = 0:ANGLES - 1
        I = im2double(g);
        PSF = fspecial('motion', 1.015, 90 - 90/ANGLES*i);
        noise_var = 0.0001;
        estimated_nsr = noise_var / var(I(:));
        g = deconvwnr(g, PSF, estimated_nsr);
    end
    
    % -- Final Resize -- %
    g = imresize(g, r2); % Resize with 22 scale (1.6)
end


























