function [ im_mod ] = MedianFilter( img )
a=RGB2GrayConverter(img);
A = zeros(size(a,1)+1);
mask=zeros(9);
for i=2:size(A,1)-1
    for j=2:size(A,2)-1
    A(i,j)=a(i-1,j-1);
    end
end
for i=2:size(A,1)-1
    for j=2:size(A,2)-1
    inc=1;
    for p=i-1:i+1
        for q=j-1:j+1
            mask(inc)=A(p,q);
            inc=inc+1;
        end
    end
    M=sort(mask);
    A(i,j)=M(5);
    end
end
im_mod=uint8(A);
imshow(im_mod);
end
