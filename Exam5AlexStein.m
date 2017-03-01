global M C K LIM1;

M=1.4826;
C=.24826;
K=24.826;
LIM1=.1;
x0=0;
v01=0.2;
v02=0.94826;
Tfinal=30;

options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TNL,YNL]=ode45(@nonlinspringdotExam5,[0 Tfinal],[x0 v01],options);
subplot(2,1,1)
plot(TNL,YNL(1:end,1));
legend('nonlinear')
title('Runge-Kutta Solution for vo1')
xlabel('Time');
ylabel('Theta');

[TNL,YNL]=ode45(@nonlinspringdotExam5,[0 Tfinal],[x0 v02],options);
subplot(2,1,2)
plot(TNL,YNL(1:end,1));
legend('nonlinear')
title('Runge-Kutta Solution for vo2')
xlabel('Time');
ylabel('Theta');

