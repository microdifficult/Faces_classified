clc
clear all;
t=1:0.1:3.5;
pore=0:0.01:0.2;
rw=0.1:0.1:3;
for i=1:30
    r0=t.^2.*rw(i)/0.1;
    a(:,i)=r0';
end


