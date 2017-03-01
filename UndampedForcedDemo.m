%Undamped Forced Demo
clf;
t=0:.01:20;
global omegan omegaf mo;
omegan = 6;
omegaf=3.3;
theta0= 0.7;
omega0=0.5;
mo=10;


%for omegaf=5.5:.01:6.5
theta=omega0/omegan*sin(omegan*t)+...
    (theta0-(mo/(omegan^2-omegaf^2)))*cos(omegan*t)+...
    (mo/(omegan^2-omegaf^2))*cos(omegaf*t);
thetaf=(mo/(omegan^2-omegaf^2))*cos(omegaf*t);
% plot(t,theta,t,thetaf)
% title(['Omegaf = ',num2str(omegaf)]);
% drawnow;
% pause(0.75);
% end


options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TL,YL] = ode45(@forcedundampeddot,[0 20],[theta0 omega0],options);
% [TNL,YNL] = ode45(@nonlinpendot,[0 12],[4/5*pi 0],options);
plot(TL,YL(:,1),'o',t,theta,'*')