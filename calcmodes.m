function calcmodes()

m1=1;
m2=2;
m3=3;
k1=1;
k2=2;
k3=3;
k4=4;

x10=0;
x20=0.1;
x30=0;
v10=.1;
v20=-.1;
v30=0;
X0=[x10;x20;x30];
V0=[v10;v20;v30];

F0= evalin('base', 'F0');
omegaf=evalin('base', 'omegaf')/100;
%B=[0;1;0];
tfinal=evalin('base', 'Tf');
B=evalin('base', 'B')';

M=[m1 0 0;0 m2 0;0 0 m3];
K=[k1+k2+k4 -k2 -k4;-k2 k2+k3 -k3;-k4 -k3 k3+k4];
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
plot(t,r(1,:),t,r(2,:),t,r(3,:));
legend('R1', 'R2', 'R3','Location','southwest');
title('Modes')


subplot(2,1,2);
plot(t,X(1,:),t,X(2,:),t,X(3,:));
legend('x1', 'x2', 'x3','Location','southwest');
title('Spatial');

end