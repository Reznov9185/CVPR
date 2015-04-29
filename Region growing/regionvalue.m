function [ rvalue ] = regionvalue( b,status,region )
%REGION VALUES
rvalue=0;
flag=0;
for i=1:size(b,1)
    for j=1:size(b,2)
        if(status(i,j)==region)
            rvalue=b(i,j);  %current region seed 
            flag=1;
        end
        if(flag==1)
            break;
        end
    end
    if(flag==1)
        break;
    end
end
end

