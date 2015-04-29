function image=imRLE_dec(RLE)
image=zeros(RLE{3},RLE{4}); 
i=1;
j=1;
for p=1:length(RLE{1})
    for c=1:RLE{2}(1,p)
        image(i,j)=RLE{1}(1,p);
        j=j+1;
        if(j>RLE{4})
            i=i+1;
            j=1;
        end
    end
end
end
