function immoravec = im_moravec(im)
image=imread(im);
imgray=uint8(image(:,:,1)*.3 +image(:,:,2)*.6+image(:,:,3)*.1);
s=padarray(imgray,[2,2],'replicate','both');
img=medfilt2(s);
imtool(img);
end