clear all;
clc;
load matlab3.mat;
for i=1:(size(p,1))
    k=1;
    b(k,:)=p(i,:);
    for j=i+1:(size(p,1))
        for t=1:i
        if(strcmp(p{j,1},c{t,1})==1)
            continue;
       if strcmp(p{i,1},p{j,1})==1
           b(k+1,:)=p(j,:);
           k=k+1;
       end;
        
        end;
    end
    q=cell2mat(b(:,2));
       maximum=max(q);
       minimum=min(q);
       c(i,:)={p{i,1},maximum,minimum};
       clear b;
       clear maximum;
       clear minimum;
    end  
end




     