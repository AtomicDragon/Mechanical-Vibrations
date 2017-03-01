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
F1hat=44.826;
theta0=.5;
omega0=.25;
t0=0;
eps=0.005;
%Part A
omegad=omegan*sqrt(1-zeta^2);
A2=theta0;
A1=(omega0+theta0*omegan*zeta)/omegad;
theta_t=exp(-zeta*omegan*t).*(A1*sin(omegad*t)+...
    A2*cos(omegad*t));
for i=1:size(t,2)
    
    x1(i)=F1hat/M*Heaviside(t(i)-t0)*Step(t(i),t0);
end

plot(t,x1+theta_t);
title('Underdamped response with Impulse Part A Exam 3');
xlabel('Time');
ylabel('Theta');
