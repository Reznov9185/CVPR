function [ im_mod ] = InverseDCT( img ) %backward(inverse) DCT
a=img; %read image matrix
x=1;
y=1;
while(y <=size(a,2))  % for image width
    u=0;v=0;
    for i=x:x+7       % for each (8x8) subimage length  
        u=u+1;
        v=0;
        for j=y:y+7     % for each (8x8) subimage width
            v=v+1;
            img_mod(u,v)=a(i,j);    %saving current (8x8) subimage
        end
    end
    for p=1:8               %for each block length
        for q=1:8           %for each block width
            sum=0;
            for m=1:8
                for n=1:8
                    %alpha1 in DCT eqn
                    if(m == 1)
                        alpha1=1/sqrt(2);
                    else
                        alpha1=1;
                    end
                     %alpha2 in DCT eqn
                    if(n == 1)
                        alpha2=1/sqrt(2);
                    else
                        alpha2=1;
                    end
                     %calculation of the forward DCT
                    sum=sum+img_mod(m,n)*alpha1*alpha2*cos(((2*(p-1)+1)*(m-1)*pi)/16)*cos(((2*(q-1)+1)*(n-1)*pi)/16); 
                end
            end
            img_R(p,q)=round((2/8)*sum);
        end
    end
    s=1;t=1;
    for c=x:x+7
        t=1;
        for d=y:y+7
            compiled(c,d)=img_R(s,t);   %accumulating all (8x8) blocks
            t=t+1;
        end
        s=s+1;
    end
    %turning to next (8x8) block
    x=x+8;
    if (x>=size(a,1))
        x=1;
        y=y+8;
    end
end
im_mod=compiled;
end

