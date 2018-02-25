%% Relative Wavelet Entropy
% Arun Kumar A
% aka.bhagya@gmail.com
% Santhom Computing Facility
% 3-5-12



function [rwen w1 w2] = rwe(data1,data2,level,wav)

[w1 pj] = wventrpy(data1,level,wav);
[w2 qj] = wventrpy(data2,level,wav);

rwen = sum(pj.*(log(pj./qj)));

