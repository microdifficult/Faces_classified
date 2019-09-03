clc
clear all;
load rw.mat;
% ssp=input('ssp is...\n');
% h=input('depthis ...\n');
for i=1:size(ssp,1)
t(i)=30+71/3008*dept(i);
tf(i)=1.8*t(i)+32;
k(i)=60+0.133*tf(i);
a(i)=10^(-ssp(i)/k(i));
rmn=71.4*0.181/82;
rmfn=0.8*rmn^1.07;
if rmfn>0.1
    rmfen=0.85*rmfn;
else
    rmfen=(146*rmfn-5)/(337*rmfn+77);
end
rwen(i)=rmfen/a(i);
if rwen(i)>0.12
    rwn(i)=-0.58+10^(0.69*rwen(i)-0.24);
else
    rwn(i)=(77*rwen(i)+5)/(146-337*rwen(i));
end
x(i)=(3.562-log10(rwn(i)-0.0123))/0.955;
p(i)=10^x(i);
rw(i)=82*rwn(i)/(tf(i)+7);
end
rw=rw';
p=p';
    