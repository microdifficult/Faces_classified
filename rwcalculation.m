clc
clear all;
% ssp=input('ssp is...\n');
% h=input('depthis ...\n');
ssp=48.4;
h=2601;
t=30+71/3008*h;
tf=1.8*t+32;
k=60+0.133*tf;
a=10^(-ssp/k);
rmn=71.4*0.181/82;
rmfn=0.8*rmn^1.07;
if rmfn>0.1
    rmfen=0.85*rmfn;
else
    rmfen=(146*rmfn-5)/(337*rmfn+77);
end
rwen=rmfen/a;
if rwen>0.12
    rwn=-0.58+10^(0.69*rwen-0.24);
else
    rwn=(77*rwen+5)/(146-337*rwen);
end
rw=82*rwn/(tf+7);

    