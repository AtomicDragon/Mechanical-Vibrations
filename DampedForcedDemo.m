%Damped Forced Demo
clf;
t=0:.01:20;
global omegan omegaf mo zeta;
omegan = 6;
omegaf=3.3;
theta0= 0.7;
omega0=1.5;
mo=10;
zeta=0.05;
omegad=omegan*sqrt(1-zeta^2);

Beta = atan(2*omegan*omegaf*zeta/(omegan^2-omegaf^2));
X = mo/sqrt((omegan^2-omegaf^2)^2+(2*omegan*omegaf*zeta)^2);
A2=theta0-X*cos(-Beta);
A1=(omega0+zeta*omegan*A2+X*omegaf*sin(-Beta))/omegad;

theta=X*cos(omegaf*t-Beta)+A1*exp(-zeta*omegan*t).*sin(omegad*t)...
    +A2*exp(-zeta*omegan*t).*cos(omegad*t);

plot(t,theta)
% return
% title(['Omegaf = ',num2str(omegaf)]);
% drawnow;
% pause(0.75);
% end


options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TL,YL] = ode45(@forceddampeddot,[0 20],[theta0 omega0],options);
% [TNL,YNL] = ode45(@nonlinpendot,[0 12],[4/5*pi 0],options);
plot(TL,YL(:,1),'-',t,theta,'*')