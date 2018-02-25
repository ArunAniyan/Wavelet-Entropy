%% Moving average entropy 
% Arun Kumar A
% aka.bhagya@gmail.com
% Santhom Computing Facility
% 8-5-12


function [mentropy e] = maswent(data,winlen,wav,levl,spcs)
% Input Arguments
% data -> Data
% winlen -> Length of moving window
% wav -> Wavelet
% levl -> Level of DWT
% spcs -> Step size of window

% Output Argument
% mentropy -> Entropy calculated using moving window
% e -> Energy
%% Initializations

l = length(data);

% n1 -> Starting point of moving window
% n2 -> End point of moving window

n=1; 



for i =1:l
    
       
    n1=n;
    n2=n+winlen;
    
    if n2 > l
        
        break;
        
    end
    
    [en e] = swentropy(data(n1:n2),levl,wav);   
    
    mentropy(i) = en;
    e(i,:) = e;
    n = n1+spcs;
    
    
    
end

    
