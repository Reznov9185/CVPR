function [ r ] = findRegion( status,region )
% find the next availble region to grow
    B= status > region;
    C=status(B);
    r=min(C); 
end

