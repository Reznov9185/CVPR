RLE=imRLE('grey.jpg'); %run length encoded
compression_rate=((length(RLE{1})+length(RLE{2}))/(RLE{3}*RLE{4}))*100; %compression rate
img=imRLE_dec(RLE);    %run length decoded
imshow(uint8(img));
title('Decompressed Image (Using Run length encoding and decoding)');