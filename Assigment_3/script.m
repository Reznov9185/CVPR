RLE=imRLE('grey.jpg');
compression_rate=((length(RLE{1})+length(RLE{2}))/(RLE{3}*RLE{4}))*100;
a=RLE{1,1}(1,555);
img=imRLE_dec(RLE);
imshow(uint8(img));