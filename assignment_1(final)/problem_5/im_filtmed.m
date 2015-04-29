function imMedFilt= im_filtmed(im) %take a RGB image and apply median filter on it's one channel
img=imread(im);
imgray=uint8(img(:,:,1)*.3 +img(:,:,2)*.6+img(:,:,3)*.1); %grayscaled the image
imMedFilt = ones(size(imgray,1),size(imgray,2));
mask=ones(3,3); %selected the odd 2D mask
im_pad=padarray(imgray,[1,1],'replicate','both'); %make it 3x3 for the edge indexes of 'im'
for i=2:size(im_pad,1)-1 %for each column
    for j=2: size(im_pad,2)-1 %for each row
       arr=[(im_pad(i-1,j-1)*mask(1,1)) (im_pad(i-1,j)*mask(1,2)) (im_pad(i-1,j+1)*mask(1,3)) (im_pad(i,j-1)*mask(2,1)) (im_pad(i,j)*mask(2,2)) (im_pad(i,j+1)*mask(2,3)) (im_pad(i+1,j-1)*mask(3,1)) (im_pad(i+1,j)*mask(3,2)) (im_pad(i+1,j+1)*mask(3,3))]; %median filtering
       imMedFilt(i-1,j-1)=median(arr); %assigning the median values
    end
end
% subplot(1,2,1),imshow(uint8(imgray));
% title('Grayscale image');
% subplot(1,2,2),imshow(uint8(imMedFilt));
% title('Median Filtered');
end

