%% Calculate wavelet entropy & associated paramters
% Arun Kumar A
% aka.bhagya@gmail.com
% Santhom Computing Facility
% 02-05-12



function [WTE P] = wventrpy(x,l,wav) 
% Input Arguments
% x -> Data
% l -> Level of DWT
% wav -> Wavelet

% Output arguments
% WTE -> Wavelet Entropy
% P -> Power

% How to run, eg.
% [w p] = mventropy(data1,5,'sym5')


%% Multilevel DWT 

n=length(x); % Length of vector

a=x ;

for i=1:l
    
    [a ~] = dwt(a,wav);            % Recursivley transform on each approximations
    
    ap{i} = a;
    
end


%% Energy

% First Calculate normalised energy at each level

for i=1:l
    
    vals = ap{i};
    
    E(i) = (sum(vals.^2))/n;              % Eq (4)        
    
end
  
%% Total energy

Etot = sum(E);                             % Eq (5)

%% Relative total energy

for j=1:l
    
    P(j) = E(j)/Etot ;                      % Eq (6)
    
end

%% Shannon Wavelet Entropy

WTE = -(sum(P.*(log(P))));                  % Eq (7)
