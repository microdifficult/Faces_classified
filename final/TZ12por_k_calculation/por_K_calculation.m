clc;
clear all;
load TZ12.mat
aa=[AC,DEN,DEPTH,faces,GR,layer];
%上一混合坪
temp1=aa(aa(:,4)==3&aa(:,6)==1,:);
por1=-0.1*temp1(:,5)-20.74*temp1(:,2)+0.51*temp1(:,1)+37.147;
perm1=exp(0.1153*por1(:,1)-0.097*temp1(:,5)+8.2488);
temp1=[temp1,por1,perm1];



%不连续性潮道
temp2=aa(aa(:,4)==1&aa(:,6)==1,:);
por2=-0.14*temp2(:,5)-34.81*temp2(:,2)+0.57*temp2(:,1)+67.07;
temp2=[temp2,por2];
for i=1:size(temp2,1)
    if temp2(i,7)<8
        temp2(i,8)=exp(0.7072*por2(i,1)-0.0586*temp2(i,5)+0.86201);
    else
        temp2(i,8)=exp(0.2756*por2(i,1)-0.104*temp2(i,5)+6.9);
    end
end




%上三混合坪
temp3=aa(aa(:,4)==3&aa(:,6)==3,:);
por3=-0.14*temp3(:,5)-24.68*temp3(:,2)+0.51*temp3(:,1)+48.25;
temp3=[temp3,por3];
for i=1:size(temp3,1)
    if temp3(i,7)<8
        temp3(i,8)=exp(0.2575*por3(i,1)-0.027*temp3(i,5)-0.74);
    else
        temp3(i,8)=exp(0.498*por3(i,1)-0.085*temp3(i,5)+1.63);
    end
end



%上三砂坪
temp4=aa(aa(:,4)==4&aa(:,6)==3,:);
por4=-0.11*temp4(:,5)-25.24*temp4(:,2)+0.24*temp4(:,1)+65.76;
perm4=exp(0.581*por4(:,1)-0.0005*temp4(:,5)-5.33);
temp4=[temp4,por4,perm4];

%上三下切型潮道
temp5=aa(aa(:,4)==2&aa(:,6)==3,:);
por5=-0.09*temp5(:,5)-17.35*temp5(:,2)+0.5*temp5(:,1)+27.57;
temp5=[temp5,por5];
for i=1:size(temp5,1)
    if temp5(i,7)<8
        temp5(i,8)=exp(0.3141*por5(i,1)-0.0335*temp5(i,5)+0.34);
    else
        temp5(i,8)=exp(0.3747*por5(i,1)-0.05*temp5(i,5)+1.23);
    end
end








temp=[temp1;temp2;temp3;temp4;temp5];

temp=sortrows(temp,3);

