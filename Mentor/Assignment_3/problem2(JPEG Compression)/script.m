v=ForwardDCT('grey.jpg'); %forward DCT transformation (with quantization inside) 
orginal=imread('grey.jpg'); %given image
RLE=imRLE(v);             %Run length encoding (from previous answer) 
dec=imRLE_dec(RLE);       %Run lenght decoding (from previous answer)
dquan=dequantize(dec,1);  %Run dequantization  
r=InverseDCT(dquan);      %backward(inverse DCT)
subplot(1,2,1), imshow((uint8(orginal)));
title('Given Image');
subplot(1,2,2), imshow((uint8(r)))
title('JPEG Image');       