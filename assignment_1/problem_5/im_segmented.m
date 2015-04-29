function imsegmented= im_segmented(im) %do segmentation to a landscape image (2 segments) 
imfilt=im_filtmed(im); %grayscaled and median filtered
seg_w(size(imfilt,1):size(imfilt,2))=0; %defined light segment
seg_b(size(imfilt,1):size(imfilt,2))=0; %defined dark segment
for i=1:size(imfilt,1)-1 %for each column
    for j=1: size(imfilt,2)-1 %for each row
       if(imfilt(i,j)<150)
           seg_b(i,j)=imfilt(i,j); %dark pixels on the dark segment
           seg_w(i,j)=0; %black on that segment in white segment 
       else
           seg_w(i,j)=imfilt(i,j); %light pixels on the light segment
           seg_b(i,j)=255; %white on that segment in dark segment
       end
    end
end
imsegmented=uint8(imfilt);
figure('units','normalized','outerposition',[0 0 1 1]) %fullscreen the figure
subplot(1,2,1),imshow(uint8(seg_b)); %shows dark segment
title('Dark Segment (On white background)'); 
subplot(1,2,2),imshow(uint8(seg_w)); %shows light segment
title('Light Segment (On black background)');
end
