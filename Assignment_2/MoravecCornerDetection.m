function [ corner_detection ] = MoravecCornerDetection( img )
a=imread(img);
a=rgb2gray(a);
a=padarray(a,[2 2],'replicate','both');
cur_patch=1;
left_patch=0;
top_patch=0;
right_patch=0;
down_patch=0;
cur_inc=1;
m=1;
n=1;
sum1=0;
sum2=0;
sum3=0;
sum4=0;
for i=3:size(a,1)-2
    for j=3:size(a,2)-2
        for p=i-1:i+1
            for q=j-1:j+1
             cur_patch(cur_inc)=a(p,q);
             cur_inc=cur_inc+1;
            end
        end
        cur_inc=1;
        for x=1:4
            switch x
               case 1
                    for p=i-1:i+1
                        for q=j-2:j
                            left_patch(cur_inc)=a(p,q);
                            cur_inc=cur_inc+1;
                        end
                    end
                    difference= cur_patch-left_patch;
                    squared=difference.^2;
                    sum1=sum(squared);
					                    
                case 2
                    cur_inc=1;
                     for p=i-2:i
                        for q=j-1:j+1
                            top_patch(cur_inc)=a(p,q);
                            cur_inc=cur_inc+1;
                        end
                    end
                    difference= cur_patch-top_patch;
                    squared=difference.^2;
                    sum2=sum(squared);
                    cur_inc=1;
                    
                case 3
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
					cur_inc=1;
                    
                case 4
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
					cur_inc=1;
           end
        end
        im_mod(m,n)=sum1 + sum2 + sum3 + sum4;
        n=n+1;
    end
    m=m+1;
    n=1;
end
b=zeros(288,288);
for i=1:size(im_mod,1)
    for j=1:size(im_mod,2)
        if (im_mod(i,j) > 350000)
            b(i,j)=a(i,j);
        end
    end
end
imshow(b);
corner_detection=b;
end
