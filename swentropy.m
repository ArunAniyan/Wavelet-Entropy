%% Wavelet entropy based in SWT 
% Arun Kumar A
% Santhom Computing Facility
% aka.bhagya@gmail.com
% 25-09-12


function [WTE E] = swentropy(x,l,wav) 
% Input Arguments
% x -> Data
% l -> Level of DWT
% wav -> Wavelet
% Output arguments
% WTE -> Wavelet Entropy
% P -> Power

%% Multilevel DWT 

n=length(x); % Length of vector

[lp ~] = wfilters(wav,'d');
a =x;
%ap=ones(l,600);

for i=1:l
    
    a = wconv1(a,lp) ;            % Recursivley transform on each approximations
    
    ap{i} = a(1:n);
    
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
