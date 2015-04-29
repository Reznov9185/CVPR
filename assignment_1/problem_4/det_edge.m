function edges = det_edge(im,thres_high,thres_low) %edge detection function
imfilt=uint8(im_filtmed(im));
for i=1:size(imfilt,1)-1 %for each column
    for j=1: size(imfilt,2)-1 %for each row
       im_x(i,j)=uint8(imfilt(i,j)-imfilt(i,j+1)); %(d(x,y)/dx) derivative along x-axis
       im_y(i,j)=uint8(imfilt(i,j)-imfilt(i+1,j)); %(d(x,y)/dy) derivative along y-axis
       if(round(sqrt(double((im_x(i,j).^2)+(im_y(i,j).^2))))<=thres_high) %high threshold checking
           edges_h(i,j)=0;
       else
            edges_h(i,j)=round(sqrt(double((im_x(i,j).^2)+(im_y(i,j).^2))));
       end
       if(round(sqrt(double((im_x(i,j).^2)+(im_y(i,j).^2))))<=thres_low) %low threshold checking
           edges_l(i,j)=0;
       else
           edges_l(i,j)=round(sqrt(double((im_x(i,j).^2)+(im_y(i,j).^2))));
       end
    end
end
edges=(edges_h+edges_l); % added high-low threshold
imshow(edges); 

end
