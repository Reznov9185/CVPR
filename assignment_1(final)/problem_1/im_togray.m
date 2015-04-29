function imgray = im_togray(im) % returns the grayscale image from any image as input
img=imread(im);
imgray=uint8(img(:,:,1)*.3 +img(:,:,2)*.6+img(:,:,3)*.1); %the grayscale contains 30% of RED , 60% of GREEN and 10% of BLUE.
figure('units','normalized','outerposition',[0 0 1 1]) %fullscreen the figure
subplot(1,2,1),imshow(img);
title('Given Image');
subplot(1,2,2),imshow(imgray);
title('Grayscale image');
end

