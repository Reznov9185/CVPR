function image=imRLE_dec(RLE)  %run length decoding 
image=zeros(RLE{3},RLE{4});    %creating image size matrix
i=1;
j=1;
for p=1:length(RLE{1})          %for each the pixels
    for c=1:RLE{2}(1,p)         %for each pixel occurrances
        image(i,j)=RLE{1}(1,p); %assigning pixel values
        j=j+1;
        if(j>RLE{4})            %for the next row
            i=i+1;
            j=1;
        end
    end
end
end
