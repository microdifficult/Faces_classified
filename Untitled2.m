clc
b=eyes(size(aa,1),size(aa,2));
for i=1:size(aa,1)
    b(i,:)=aa(i,:);
    if aa(i,:)==aa(i+1,:)
        b(i+1,:)=aa(i+1,:);
    end
end
