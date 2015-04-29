function imAvgFilt= im_filtavg(im) %take a RGB image and apply median average filter on grayscale
img=imread(im);
imgray=uint8(img(:,:,1)*.3 +img(:,:,2)*.6+img(:,:,3)*.1); %grayscaled the image
mask=ones(5,5)/25; %selected the odd 2D mask
imAvgFilt=uint8(filter2(mask,imgray,'same')); %average filtered
subplot(1,2,1),imshow(imgray);
title('Grayscale image');
subplot(1,2,2),imshow(imAvgFilt);
title('Average filtered');
end

