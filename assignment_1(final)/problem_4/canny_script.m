figure('units','normalized','outerposition',[0 0 1 1]) %fullscreen the figure
subplot(1,2,1),imshow(EdgeDetector('1.jpg')); %shows dark segment
title('Edge detection using SOBEL'); 
subplot(1,2,2),imshow(CannyEdgeDetection('1.jpg',999,120)); %shows light segment
title('Canny edge detection');