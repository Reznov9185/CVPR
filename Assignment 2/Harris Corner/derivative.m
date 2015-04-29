function  im_mod = derivative( im,m )
    s=padarray(im,[1,1],'replicate','both'); %for 3x3 window in boardering pixels
   
    im_mod = ones(size(im,1),size(im,2)); 
    s=double(s);
    for i = 2:size(s,1)-1  % for each column
        for j = 2:size(s,2)-1  % for each row
%         value=((s(i-1,j-1)*m(1,1))+(s(i-1,j)*m(1,2))+(s(i-1,j+1)*m(1,3))+(s(i,j-1)*m(2,1))+(s(i,j)*m(2,2))+(s(i,j+1)*m(2,3))+(s(i+1,j-1)*m(3,1))+(s(i+1,j)*m(3,2))+(s(i+1,j+1)*m(3,3)))/divisor;
        value=(s(i-1,j-1)*m(1,1))+(s(i-1,j)*m(1,2))+(s(i-1,j+1)*m(1,3))+(s(i,j-1)*m(2,1))+(s(i,j)*m(2,2))+(s(i,j+1)*m(2,3))+(s(i+1,j-1)*m(3,1))+(s(i+1,j)*m(3,2))+(s(i+1,j+1)*m(3,3)); %sobel with mask m
        im_mod(i-1,j-1)=value;   
        end
    end


end

