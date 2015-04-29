function [ im_mod ] = CannyEdgeDetection( img,max_threshold,min_threshold) 
a=MedianFilter( img ); %median filtering
a=double(a); 
G=zeros(size(a,1),size(a,2));
theta=zeros(size(a,1),size(a,2));
S=zeros(size(a,1),size(a,2));
for i=1:size(a,1)-2       
    for j=1:size(a,2)-2
        Gx=(a(i+2,j)+2*a(i+2,j+1)+a(i+2,j+2))-(a(i,j)+2*a(i,j+1)+a(i,j+2));
        Gy=(a(i,j+2)+2*a(i+1,j+2)+a(i+2,j+2))-(a(i,j)+2*a(i+1,j)+a(i+2,j));
        G(i,j)=round(sqrt(Gx.^2+Gy.^2)); %finding the norm-image (using sobel )
        
        thisAngle =rad2deg(atan2(Gy,Gx)); % the tangent angle 
        
        % Generalise the angles (0, 45, 90, 135) 
        if ( ( (thisAngle < 22.5) && (thisAngle > -22.5) ) || (thisAngle > 157.5) && (thisAngle < -157.5) )
            newAngle = 0; 
        elseif ( ( (thisAngle > 22.5) && (thisAngle < 67.5) ) || ( (thisAngle < -112.5) && (thisAngle > -157.5) ) )
             newAngle = 45;
        elseif ( ( (thisAngle > 67.5) && (thisAngle < 112.5) ) || ( (thisAngle < -67.5) && (thisAngle > -112.5) ) )
           		
            newAngle = 90;
        elseif ( ( (thisAngle > 112.5) && (thisAngle < 157.5) ) || ( (thisAngle < -22.5) && (thisAngle > -67.5) ) )
            newAngle = 135;
        end
        theta(i,j) = newAngle; % forming the angle matrix
   end
end

theta = padarray(theta,[1 1]);
G = padarray(G,[1 1]);
S = padarray(S,[1 1]);

%NON-MAXIMUM-SUPRESSIOM

for i=2:size(theta,1)-1
    for j=2:size(theta,2)-1
        switch theta(i,j) 
            case 0
                if (G(i,j)>=G(i,j+1) && G(i,j)>=G(i,j-1))
                    S(i,j)=G(i,j);
                    S(i,j+1)=0;
                    S(i,j-1)=0;
                elseif (G(i,j-1)>G(i,j) && G(i,j-1)>=G(i,j+1))
                    S(i,j-1)=G(i,j-1);
                    S(i,j)=0;
                    S(i,j+1)=0;
                else
                    S(i,j+1)=G(i,j+1);
                    S(i,j)=0;
                    S(i,j-1)=0;
                end
            case 45
                if (G(i,j)>=G(i-1,j+1) && G(i,j)>=G(i+1,j-1))
                    S(i,j)=G(i,j);
                    S(i-1,j+1)=0;
                    S(i+1,j-1)=0;
                elseif (G(i-1,j+1)>G(i,j) && G(i-1,j+1)>=G(i+1,j-1))
                    S(i-1,j+1)=G(i-1,j+1);
                    S(i,j)=0;
                    S(i+1,j-1)=0;
                else
                    S(i+1,j-1)=G(i+1,j-1);
                    S(i,j)=0;
                    S(i-1,j+1)=0;
                end
                
            case 90
                if (G(i,j)>=G(i-1,j) && G(i,j)>=G(i+1,j))
                    S(i,j)=G(i,j);
                    S(i-1,j)=0;
                    S(i+1,j)=0;
                elseif (G(i-1,j)>G(i,j) && G(i-1,j)>=G(i+1,j))
                    S(i-1,j)=G(i-1,j);
                    S(i,j)=0;
                    S(i+1,j)=0;
                else
                    S(i+1,j)=G(i+1,j);
                    S(i,j)=0;
                    S(i-1,j)=0;
                end
            case 135
                if (G(i,j)>=G(i-1,j-1) && G(i,j)>=G(i+1,j+1))
                    S(i,j)=G(i,j);
                    S(i-1,j-1)=0;
                    S(i+1,j+1)=0;
                elseif (G(i-1,j-1)>G(i,j) && G(i-1,j-1)>=G(i+1,j+1))
                    S(i-1,j-1)=G(i-1,j-1);
                    S(i,j)=0;
                    S(i+1,j+1)=0;
                else
                    S(i+1,j+1)=G(i+1,j+1);
                    S(i,j)=0;
                    S(i-1,j-1)=0;
                end
         end
    end
end

% thresholding and hyteresis

for i=3:size(S,1)-4
    for j=3:size(S,2)-4
        if S(i,j)>=max_threshold
            H(i,j)=S(i,j);
        else
            H(i,j)=0; 
        end
    end
end

for i=3:size(S,1)-4
    for j=3:size(S,2)-4
        if S(i,j)>min_threshold
            L(i,j)=S(i,j);
        else
            L(i,j)=0;
        end
    end
end

im_mod=H+L;
im_mod=uint8(im_mod);
imshow(im_mod);
end



