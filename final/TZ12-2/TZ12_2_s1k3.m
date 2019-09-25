clear all;
clc;
load TZ12_2_layer.mat;
FACES=char(FACES);
F=FACES(1,1:end);
N=1:length(FACES);
GR(GR>124)=124;
GR(GR<52)=52;
GR=(GR-min(GR))/(max(GR)-min(GR));
i=2;
p=1;
D_start=1;
for i=i:length(FACES)
    if strcmp(F,FACES(i,1:end))==0
        D_end=i;
        Rm(p)=N(1:(D_end-D_start))*GR(1:(D_end-D_start))/((D_end-D_start+1)*(sum(GR(D_start:D_end-1))));
        Xa(p)=(sum(GR(D_start:D_end-1)))/(D_end-D_start);
        H(p)=0.125*(D_end-D_start+1);
        G1(p)=1/2/(N(D_end)-N(D_start)-1)*(GR(D_start:D_end-1)-GR(D_start+1:D_end))'*(GR(D_start:D_end-1)-GR(D_start+1:D_end));
        G2(p)=1/2/(N(D_end)-N(D_start)-2)*(GR(D_start:D_end-1)-GR(D_start+2:D_end+1))'*(GR(D_start:D_end-1)-GR(D_start+2:D_end+1));
        S2(p)=(GR(D_start:D_end-1)-Xa(p))'*(GR(D_start:D_end-1)-Xa(p))/(D_end-D_start);
        GS(p)=sqrt(G1(p)+G2(p)+S2(p)^2);
        FF(p,1:size(F,2))=F;
        
        p=p+1;
        F=FACES(i,1:end);
        D_start=i;
    end
end
AA=[Rm',Xa',H',GS'];





%%ÉÏÈýÅÐ¶¨
for i=1:10
    if AA(i,1)<0.65&&AA(i,2)>0.4&&AA(i,4)<0.125
        FACES_predtion(i)=3;
        else if AA(i,3)>10&&AA(i,4)<0.15
                FACES_predtion(i)=5;
            else FACES_predtion(i)=4;
            end
    end
end

        

        
        