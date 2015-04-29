function [ im_mod ] = RGB2GrayConverter( img )
temp=imread(img);
im_mod = 0.21*temp(:,:,1)+0.72*temp(:,:,2)+0.07*temp(:,:,3);
end

