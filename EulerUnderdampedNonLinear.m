%Euler Underdamped

C=3.5;
J=1;
Mf=10.3;
K=300;
theta0=1;
omega0=0;

tfinal = 10;
t=0:.01:tfinal;

Nsteps = 50000;
deltat = tfinal/Nsteps;

%Theoretical Solution
omegan=sqrt(K/J);
Ccr=2*sqrt(K*J);
zeta = C/Ccr;
a1=(omega0+(zeta+sqrt(zeta^2-1))*omegan*theta0)/...
 (2*omegan*sqrt(zeta^2-1));
a2=(-omega0-(zeta-sqrt(zeta^2-1))*omegan*theta0)/...
 (2*omegan*sqrt(zeta^2-1));
lambda1=-zeta*omegan+omegan*sqrt(zeta^2-1);
lambda2=-zeta*omegan-omegan*sqrt(zeta^2-1);
term1=a1*exp(lambda1*t);
term2=a2*exp(lambda2*t);
theta_t=term1+term2;
plot(t,theta_t);
title(['Underdamped response ','Zeta = ', num2str(zeta)]);

hold on;
clear theta_e omega_e

%Euler Solution
theta_e(1)=theta0;
omega_e(1)=omega0;
t_e=0:deltat:tfinal;
for i=1:Nsteps
    omega_e(i+1)= omega_e(i)-Mf/J*deltat*sign(omega_e(i))-K/J*deltat*theta_e(i);
    theta_e(i+1)= theta_e(i)+omega_e(i)*deltat;
end
plot(t_e,theta_e);

