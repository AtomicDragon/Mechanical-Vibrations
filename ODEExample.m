%Alex Stein
%Vibrations Fall 2015

global omegan;
omegan=2;

options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TL,YL] = ode45(@linpendot,[0 12],[4/5*pi 0],options);
[TNL,YNL] = ode45(@nonlinpendot,[0 12],[4/5*pi 0],options);
plot(TL,YL(:,1),'-',TNL,YNL(:,1),'-.')