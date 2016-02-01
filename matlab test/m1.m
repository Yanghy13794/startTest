clear;close all;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
derad = pi/180;         % 角度转弧度
radeg = 180/pi;         % 弧度转角度
twpi = 2*pi;            % 两倍pi
landa=1;
dd =0.25*landa; 
kelm=11;
d=-(kelm-1)/2*dd:dd:(kelm-1)/2*dd; 
snr=10;
theta=[10];
iwave=length(theta);
L=[0.3*landa];
n=500;
wk=-(twpi/landa)*sin(theta.*derad).';
faik=(pi)./(landa*L.').*(cos(theta*derad).^2).';
for i=1:kelm
      tao(i,:)=(wk*d(i)+faik*(d(i).^2)).';
end
A=exp(1i*tao);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                        2D-Mucis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=randn(iwave,n);
X=A*S;
X1 = awgn(X,snr,'measured');
Rxx = X1*X1'/n;

for cccc=1:n
figure(1)
temp1=1:kelm;
plot(temp1,X1(:,cccc));
hold on
grid on
end








