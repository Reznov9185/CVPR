function im_mod = thresh( im , limit)
    
    im_mod=zeros(size(im,1),size(im,2));
    for i = 1:size(im,1)  % for each column
        for j = 1:size(im,2)  % for each row
            if(im(i,j)>=limit)
                im_mod(i,j)=255;
            else
                im_mod(i,j)=0;
            end
        end
    end
    

end

