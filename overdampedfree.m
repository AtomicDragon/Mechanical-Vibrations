%Exponentials
lambda1=(-zeta*omegan+omegan*sqrt(zeta^2-1));
lambda2=(-zeta*omegan-omegan*sqrt(zeta^2-1));
a1 =(lambda2*theta0-omega0)/(lambda2-lambda1);
a2 =(-lambda1*theta0+omega0)/(lambda2-lambda1);
theta1=a1*exp(lambda1*t);
theta2=a2*exp(lambda2*t);
theta=theta1+theta2;
plot(t,theta1,t,theta2,t,theta);
h1=legend('theta1','theta2','theta');
title('Overdamped response theta(t)');