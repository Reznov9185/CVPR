function [status,check,mcurrent] = regionGrowing(a,threshold,status,check,x,y,value,mcurrent,rvalue)
%   REGION GROW
    check(x,y)=1;
%     D=[0 , 0];
%for the 3x3 negibours:
    for i=x-1:x+1      
        for j=y-1:y+1
            if(i==0 || j==0 || i==size(a,1)+1 || j==size(a,2)+1)
                continue;
            end
            m=a(i,j);   %current pixel value
            n=rvalue;   %current region value
            o=m-n;      %difference
            if(o==0)
                o=n-m;  %difference
            end
            if( check(i,j) ==0) %checking if no checked yet
                if( o<=threshold ) %check thresholding
                    if(status(i,j)>value || status(i,j)==0) %if neighbour is in threshold 
                        status(i,j)=value;
                    end
    %                 B=[i , j];
    %                 D=vertcat(D,B);
                else
                    if(status(i,j)==0)  %not in thereshold 
                        status(i,j)=mcurrent+1; %new region
                        mcurrent=mcurrent+1;    %current new region to be explored 
                    end
                end 
            end
        end
    end
end

