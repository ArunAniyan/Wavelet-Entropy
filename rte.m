%% Rate of entropy change
% Arun Kumar A
% aka.bhagya@gmail.com
% Santhom Computing Facility
% 3-5-12

function [gamma] = rte(data1,data2,l,wav)

w1 = wventrpy(data1,l,wav);
w2 = wventrpy(data2,l,wav);

gamma = (w1-w2)/w2;
