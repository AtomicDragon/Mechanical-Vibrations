


global M C K1 K2 Fs Fd LIM1 LIM2 F0 omegat;

M=1;
C=1;
K1=2;
K2=10;
Fs=10;
Fd=8;
LIM1=.5;
LIM2=.5;
x0=.1;
v0=0;
F0=1;
omegat=1;
Tfinal=30;

options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TL,YL]=ode45(@linMSDdot,[0 Tfinal],[x0 v0],options);
[TNL,YNL]=ode45(@nonlinspringdot,[0 Tfinal],[x0 v0],options);
plot(TL,YL(1:end,1),TNL,YNL(1:end,1));
legend('linear','nonlinear')
title('Runge-Kutta Solution')
xlabel('Time');
ylabel('Theta');