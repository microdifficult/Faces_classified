% clc
% clear all;
% load matlab.mat
grmin=input('grmin is...\n');
grmax=input('grax is...\n');
dgr=(gr-grmin)./(grmax-grmin);
vsh=((2.^(2*dgr))-1)/3*100;
