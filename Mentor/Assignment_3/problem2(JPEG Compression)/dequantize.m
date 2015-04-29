function [ quan ] = dequantize( img,m ) %JPEG IMAGE QUANTIZATION
q=[16,11,10,16,24,40,51,61;12,12,14,19,26,58,60,55;14,13,16,24,40,57,69,56;14,17,22,29,51,87,80,62;18,22,37,56,68,109,103,77;
    24,35,55,64,81,104,113,92;49,64,78,87,103,121,120,121;72,92,95,98,112,100,103,99;]
x=1;
y=1;
while(x <=size(img,1))  %for image length
    u=1;
    v=1;
    for i=x:x+7         %for current (8x8) block length
        for j=y:y+7     %for current (8x8) block width    
            img(i,j)=img(i,j)*(q(u,v)*m);   %dequantization calculation
            v=v+1;
        end
        u=u+1;
        v=1;
    end
    %turning to next (8x8) block
    y=y+8;
    if (y>=size(img,2))
        x=x+8;
        y=1;
    end
end
quan=img; %dequantized image
end

