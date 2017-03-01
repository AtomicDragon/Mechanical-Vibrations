%Alex Stein Exam 3
%Vibrations Matthew Stein 11/4/2015

clear
global omegan zeta omegad eps t0 F1hat M;
M=5;
C=3.4826;
K=20;
omegan = sqrt(K/M);
zeta = C/(2*sqrt(M*K));
omegad = omegan*sqrt(1-zeta^2);
t=0:.001:10;
F1hat=14.826;
theta0=.5;
omega0=.25;
t0=0.5;
eps=0.005;
 
% Part B
% Compare to RK Solution

options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4],'MaxStep',.0003);
[TL,YL]=ode45(@impulsedotExam3,[0 10],[theta0 omega0],options);
plot(TL,YL(1:end,1));
title('Runge-Kutta Solution Part B Exam 3')
xlabel('Time');
ylabel('Theta');
