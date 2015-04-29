function  [] = main( )
clc;
clear;
threshold=40;  %set threshhold value to 40
a=rgb2gray(imread('test.jpg')); %read our input image 
status=zeros(size(a,1),size(a,2)); %region status matrix
goal=ones(size(a,1),size(a,2));     %goal of region grow
check=zeros(size(a,1),size(a,2));   %check for region grow
b=medfilt2(medfilt2(medfilt2(medfilt2(medfilt2(medfilt2(medfilt2(medfilt2(medfilt2(a))))))))); %median filter repeatedly
% imtool(b);  
region=1; 
mcurrent=region;
seedx=2; %seed for x value in image matrix
seedy=2; %seed for y value in image matrix
% imtool(b);
% s=padarray(b,[1,1],'replicate','both');
status(seedx,seedy)=1;  %set primary status value
rvalue=b(seedx,seedy);  %curent region value
[status,check,mcurrent]=regionGrowing(b,threshold,status,check,seedx,seedy,region,mcurrent,rvalue); %after first region check
i=1;
j=1;
count=0; %number of trip on image for each grow
final=0; %region status flag   
% while(~tf)
%     flag=0;
%     for i=1:size(b,1)
%         for j=1:size(b,2)
%             if(check(i,j)~=1 && status(i,j)==region)
%                     [status,check,mcurrent] = regionGrowing(b,threshold,status,check,i,j,region,mcurrent,rvalue);
%                     flag=1;
%             end
%             tf = isequal(goal,check);
%         end
%         if(flag==1)
%             break;
%         end
%     end
%
% %     if(i==size(b,1)&& j==size(b,2))
% %
% %     end
% end

while(1)
    flag=0;             
    while(i<=size(b,1))         %for each image row
        while(j<=size(b,2))     %image each column    
            if(check(i,j)~=1 && status(i,j)==region) %check for the need of region growing
                [status,check,mcurrent] = regionGrowing(b,threshold,status,check,i,j,region,mcurrent,rvalue); %grow region
                flag=1;
            end
            
            j=j+1;             %next column
            if(flag==1 || j==size(b,2)) 
                break;
           end
        end
        if(j==size(b,2))  %for last column grow region(manually)
            [status,check,mcurrent] = regionGrowing(b,threshold,status,check,i,j,region,mcurrent,rvalue); %grow region
        end
        
        if(i==size(b,1) && j==size(b,2))    
            count=count+1;
            if(mod(count,3)==0 ) %for 3 count farme read
                region=findRegion(status,region);  %find the next availble region to grow 
                if(isempty(region))
                    final=1;
                    break;
                end
                rvalue=regionvalue(b,status,region);    %the next region value to grow
                count=0;
            end
        end
        if(final==1)
            break;
        end
        if(j==size(b,2))
            if(i<size(b,1))
                i=i+1;
            else
                i=1;
            end
            j=1;
        end
        if(flag==1)
            break;
        end
    end
    if(final==1)
        break;
    end
end
end


    