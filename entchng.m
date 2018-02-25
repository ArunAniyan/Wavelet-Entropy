%% Rate of entropy change  across signals
% Arun Kumar A
% Santhom Computing Facility
% aka.bhagya@gmail.com
% 28-09-12

% Divides the total signal into a set of frames of fixed length and
% calculate relative entropy change


function [rtchng rng] = entchng(data,winlen,lvl,wav)

l = length(data);

if ( (winlen/l) >=1 )
    
    disp (' Window length out of bounds')
    
    return
    
end

steps = round( fix(l/winlen)/2);

x1 = 1; 
x2 = winlen;
x3 = x2 + 1; 
x4 = x2 + winlen; 

for i =1:steps
    
    rng(i,1:2) = [x1 x4];
    
    rtchng(i) = rte(data(x1:x2),data(x3:x4),lvl,wav) ; 
    
    x1 = x4+1;
    x2 = x4+winlen;
    x3 = x2+1;
    x4 = x2+winlen;

end

