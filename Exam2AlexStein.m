%Exam 2 Alexander Stein

clear;
clf;
t=0:.001:10;
global omegan omegaf mo zeta;
J=5;
K=20;
Ccr=2*sqrt(J*K);
C=3.4826;
F=3; 
omegan = sqrt(K/J);
omegaf=1.5;
theta0= 2;
omega0=0.25;
mo=F/J;
zeta=C/Ccr;
omegad=omegan*sqrt(1-zeta^2);

%Part A
Beta = atan(2*omegan*omegaf*zeta/(omegan^2-omegaf^2));
X = mo/sqrt((omegan^2-omegaf^2)^2+(2*omegan*omegaf*zeta)^2);
A2=theta0-X*cos(-Beta);
A1=(omega0+zeta*omegan*A2+X*omegaf*sin(-Beta))/omegad;

theta=X*cos(omegaf*t-Beta)+A1*exp(-zeta*omegan*t).*sin(omegad*t)...
    +A2*exp(-zeta*omegan*t).*cos(omegad*t);
maxTheta = -1;
maxTime = -1;
for i=1:size(t,2)
    if (theta(i) > maxTheta)
        maxTheta = theta(i);
        maxTime = i;
    end
end
disp('PART A ==================');
disp(' ');
disp(['The maximum displacement is ',num2str(maxTheta),' which occurs at time = ',num2str(maxTime/1000),' seconds']);
disp(' ');

%Part B
Answer1 = theta(1482);
Answer2 = theta(8482);
disp('PART B ==================');
disp('TIME         x(t)');
disp(['1.482     ',num2str(Answer1)]);
disp(['8.482     ',num2str(Answer2)]);

%Part C
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TL,YL] = ode45(@forceddampeddot,[0 10],[theta0 omega0],options);

plot(TL,YL(:,1),'-',t,theta,t,3*cos(omegaf*t))
title('Alex Stein Exam 2 Forced Damped Solution');
h1=legend('Numeric Solution','Theoretical Response','Forcing Function');