function [ corner_detection ] = MoravecCornerDetection( img )
a=imread(img);
a=padarray(a,[2 2],'replicate','both'); %2 rows and columns are replicated to use 3 x 3 patch
cur_patch=1; %shows runtime patch values
left_patch=0; %shows left patch values for certain pixel
top_patch=0; %shows top patch values for certain pixel
right_patch=0; %shows right patch values for certain pixel
down_patch=0; %shows down patch values for certain pixel
cur_inc=1;
m=1;
n=1;
sum1=0;
sum2=0;
sum3=0;
sum4=0;
for i=3:size(a,1)-2 %for rows
    for j=3:size(a,2)-2 %for columns
        for p=i-1:i+1 % for patch row
            for q=j-1:j+1 % for patch column
                cur_patch(cur_inc)=a(p,q); %storing neighbouring values of current patch
                cur_inc=cur_inc+1; % index increment
            end
        end
        cur_inc=1;
        for x=1:4 % for four patches we are going to derive
            switch x
                case 1 %for left shift
                    for p=i-1:i+1
                        for q=j-2:j
                            left_patch(cur_inc)=a(p,q);
                            cur_inc=cur_inc+1;
                        end
                    end
                    difference= cur_patch-left_patch;
                    squared=difference.^2;
                    sum1=sum(squared); %using SSD
                    
                case 2 %for top shift
                    cur_inc=1;
                    for p=i-2:i
                        for q=j-1:j+1
                            top_patch(cur_inc)=a(p,q);
                            cur_inc=cur_inc+1;
                        end
                    end
                    difference= cur_patch-top_patch;
                    squared=difference.^2;
                    sum2=sum(squared); %using SSD
                    cur_inc=1;
                    
                case 3 %for right shift
                    cur_inc=1;
                    for p=i-1:i+1
                        for q=j:j+2
                            right_patch(cur_inc)=a(p,q);
                            cur_inc=cur_inc+1;
                        end
                    end
                    difference= cur_patch-top_patch;
                    squared=difference.^2;
                    sum3=sum(squared);
                    cur_inc=1; %using SSD
                    
                case 4 %for down shift
                    cur_inc=1;
                    for p=i:i+2
                        for q=j-1:j+1
                            down_patch(cur_inc)=a(p,q);
                            cur_inc=cur_inc+1;
                        end
                    end
                    difference= cur_patch-top_patch;
                    squared=difference.^2;
                    sum4=sum(squared);
                    cur_inc=1; %using SSD
            end
        end
        im_mod(m,n)=sum1 + sum2 + sum3 + sum4; % sum of SSD of all 4 patches 
        n=n+1;
    end
    m=m+1;
    n=1;
end

k=0;
for i=1:size(im_mod,1) %for rows
    for j=1:size(im_mod,2) %for columns
        if (im_mod(i,j) > 338000) %Using 338000 as our threshold
            k=k+1;   
            b(k,1)=i; %storing corner pixels x value
            b(k,2)=j; %storing corner pixels y value
        end
    end
end

red = uint8([255 0 0]);
markerInserter = vision.MarkerInserter('Shape','Circle','BorderColor','Custom','CustomBorderColor',red);
Pts = int32(b);
J = step(markerInserter, a, Pts); %Placing marker on corner points stored in b
imshow(J); %Image indicating corner points
corner_detection=im_mod;
end


