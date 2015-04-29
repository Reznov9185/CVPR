clc;
clear;
mx=[-1 0 1;-2 0 2;-1 0 1]; %sobel x derivative's mask
my=[1 2 1;0 0 0;-1 -2 -1]; %sobel y derivative's mask
im=imread('cb.jpg');
im=rgb2gray(im);
c=im;
%im=thresh(im,200); %thresholding for deducting noise edges
%img=medfilt2(im);
ix=derivative(im,mx); %finding x derivative
iy=derivative(im,my); %finding y derivative
M=isCorner(ix,iy); %set M matrix values
k=0;
for i=1:size(M,1) %for rows
    for j=1:size(M,2) %for columns
%         if (M(i,j) >=1050000) %thresholding
%             k=k+1;
%             b(k,1)=i; %storing corner pixels x value
%             b(k,2)=j; %storing corner pixels y value
%         elseif (M(i,j) <=520200 && M(i,j) >=20000) %thresholding
%             k=k+1;
%             b(k,1)=i; %storing corner pixels x value
%             b(k,2)=j; %storing corner pixels y value
%         end
           if (M(i,j) >=10500000 ) %thresholding
            k=k+1;
            b(k,1)=i; %storing corner pixels x value
            b(k,2)=j; %storing corner pixels y value
           end
    end
end
    red = uint8([255 0 0]);
    markerInserter = vision.MarkerInserter('Shape','Circle','BorderColor','Custom','CustomBorderColor',red);
    Pts = int32(b);
    J = step(markerInserter, c, Pts); %putting marker on cornets
    imshow(J); %show corner detected image using Harris
    res=J;
    