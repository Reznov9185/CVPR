function RLE = imRLE(im)
   img=im;
   px=[];
   ocr=[];
   count=0;
   for i=1:size(img,1)
       for j=1:size(img,2)
           if(i==1 && j==1)
               px(end+1)=img(i,j);
               count=1;
           else
               if(img(i,j)==px(length(px)))
                   count=count+1;
               else
                   ocr(end+1)=count;
                   count=1;
                   px(end+1)=img(i,j);
               end
           end 
       end
   end
   ocr(end+1)=count;
   RLE={px,ocr,size(img,1),size(img,2)};
end

