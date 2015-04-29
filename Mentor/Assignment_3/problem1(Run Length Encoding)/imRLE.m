function RLE = imRLE(im) %run length encoding 
   img=imread(im);       %image read
   px=[];                %creating pixel contaning array
   ocr=[];               %creating pixel occurance contaning array 
   count=0;              %counting occurance    
   for i=1:size(img,1)   %for each length
       for j=1:size(img,2) %for each width
           if(i==1 && j==1)
               px(end+1)=img(i,j); %archieving pixel values those are repeating
               count=1;            %1 for first occurance 
           else
               if(img(i,j)==px(length(px))) %finding more occurrance
                   count=count+1;           %increasing occurrance count
               else
                   ocr(end+1)=count;        %push the final continuous occurrance 
                   count=1;                 
                   px(end+1)=img(i,j);      %push the new pixel to the px array
               end
           end 
       end
   end
   ocr(end+1)=count;                        %for the last push of the last pixel
   RLE={px,ocr,size(img,1),size(img,2)};    %return RLE containing cells px and ocr, length and width
end

