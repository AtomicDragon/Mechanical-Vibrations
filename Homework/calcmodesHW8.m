% function calcmodes()

m1=1.4826;
m2=3.4826;
m3=4.4826;
m4=8.4826;
k1=10;
k2=15;
k3=25;
k4=12;
k5=10;
k6=15;
k7=0;
k8=20;

x10=0;
x20=0;
x30=0;
x40=0;
v10=0;
v20=0;
v30=0;
v40=0;
X0=[x10;x20;x30;x40];
V0=[v10;v20;v30;v40];

F0=2;
omegaf=6.4119;
% F0= evalin('base', 'F0');
% omegaf=evalin('base', 'omegaf')/100;
B=[0;1;0;0];
tfinal=100;
% tfinal=evalin('base', 'Tf');
% B=evalin('base', 'B')';

M=[m1 0 0 0;0 m2 0 0;0 0 m3 0;0 0 0 m4];
K=[k1+k2+k4+k8 -k2 -k4 -k8;-k2 k2+k3+k7 -k3 -k7;-k4 -k3 k3+k4+k5 -k5;-k8 -k7 -k5 k5+k6+k7+k8];
Mhalf=sqrt(M);
Mneghalf=inv(Mhalf);
Khat=Mneghalf*K*Mneghalf;
evals=eigs(Khat);
omega=sqrt(evals);
[P,d]=eigs(Khat);
S=Mneghalf*P;
Sinv=inv(P)*Mhalf;
r0=Sinv*X0;
rprime0=Sinv*V0;

f=inv(P)*Mneghalf*B*F0;
t=[0:.01:tfinal];


for j=1:size(X0,1)
for i=1:size(t,2)
r(j,i)=rprime0(j)/omega(j)*sin(omega(j)*t(i))+...
(r0(j)-(f(j)/(omega(j)^2-omegaf^2)))*cos(omega(j)*t(i))+ ...
(f(j)/(omega(j)^2-omegaf^2))*cos(omegaf*t(i));
end
end
X=S*r;

figure(2);
subplot(2,1,1);
plot(t,r(1,:),t,r(2,:),t,r(3,:),t,r(4,:));
legend('R1', 'R2', 'R3','R4','Location','southwest');
title('Modes')


subplot(2,1,2);
plot(t,X(1,:),t,X(2,:),t,X(3,:),t,X(4,:));
legend('x1', 'x2', 'x3','x4','Location','southwest');
title('Spatial');

% end