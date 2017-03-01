%Step Response Demo

%Find Theoretical Solution for Example Problem
global omegan zeta omegad t0 f0;
M=1;
K=4;
C=0.8;
zeta = C/(2*sqrt(K*M));
omegan= sqrt(K/M);
omegad= omegan*sqrt(1-zeta^2);
f0=2;
t0=.5;
tfinal=10;
t=0:0.01:tfinal;

for i=1:size(t,2)
    x(i)=(f0/K+f0/(omegad*K)*exp(-zeta*omegan*(t(i)-t0))...
        *(-zeta*omegan*sin(omegad*(t(i)-t0))-...
        omegad*cos(omegad*(t(i)-t0))))*Step(t(i),t0);
end
plot(t,x)
%plot(t,x1,t,x2,t,x1+x2);

%Compare to RK Solution

options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4],'MaxStep',.0003);
[TL,YL]=ode45(@stepresponsedot,[0 tfinal],[0 0],options);
plot(TL,YL(1:end,1),t,x);
legend('y-rk','x')
return
