function res = isCorner( ix,iy )
     for i = 1:size(ix,1)  % for each column
        for j = 1:size(ix,2)  % for each row
        m=[ix(i,j).^2 ix(i,j)*iy(i,j); ix(i,j)*iy(i,j) iy(i,j).^2 ]; %completing the M matrix for deciding corner points on Harris 
        lambda = eig(m); %two eigen values lamda_one and  lamda_two
        %a=abs(lambda(1,1)-lambda(2,1)); % finding (lamda_one~lamda_two)
        a=lambda(1,1);
        %a=(lambda(1,1)*lambda(2,1))-(0.04*((lambda(1,1)+lambda(2,1)).^2));
%         if(lambda(1,1)>99999999999 && lambda(2,1)>9999999999)
%             a=1;
%         else
%             a=0;
%         end
        res(i,j)=a; 
        end
     end
end

