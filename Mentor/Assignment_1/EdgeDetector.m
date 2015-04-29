function [ im_mod ] = EdgeDetector( img )
a=MedianFilter( img );
a=double(a);
G=ones(size(a,1),size(a,2));
for i=1:size(a,1)-2
    for j=1:size(a,2)-2
        Gx=(a(i+2,j)+2*a(i+2,j+1)+a(i+2,j+2))-(a(i,j)+2*a(i,j+1)+a(i,j+2));
        Gy=(a(i,j+2)+2*a(i+1,j+2)+a(i+2,j+2))-(a(i,j)+2*a(i+1,j)+a(i+2,j));
        G(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end

im_mod=uint8(G);
imshow(im_mod);
end

