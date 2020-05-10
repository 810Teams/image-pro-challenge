%
% preprocess.m
%

function [g] = preprocess6(f)
    g = rgb2gray(f);
    
    % -- High-pass filter -- %
    g = paddedsize(g);
    g = paddedsize(g);
    
    PQ = paddedsize(size(g));
    D0 = 0.005 * PQ(1);
    H1 = hpfilter('btw', PQ(1), PQ(2), D0);
    g = dftfilt(double(g), H1);

    g = imerode(g, [0 1 0; 1 1 1; 0 1 0]);
end
