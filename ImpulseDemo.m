%Impulse Demo
%Impulse response for a series of impulses

%Test Step Function
% t=0:.001:5;
% for i = 1:size(t,2)
%     y(i)=Step(t(i),1.5);
% end
% plot(t,y);
% return

% % Test Dirac function
% t=0:.001:5;
% for i = 1:size(t,2)
%     y(i)=Dirac(t(i),1.5,.005);
% end
% plot(t,y);
% return

% %Test Heaviside Function
% global omegan zeta omegad;
% omegan = 1;
% zeta = 0.25;
% omegad = omegan*sqrt(1-zeta^2);
% t=0:.001:20;
% for i=1:size(t,2)
%     y(i)=Heaviside(t(i));
% end
% plot(t,y);
% return

%Find Theoretical Solution for Example Problem
global omegan zeta omegad eps t1 t2 F1hat F2hat M;
omegan = 1;
zeta = 0.25;
omegad = omegan*sqrt(1-zeta^2);
t=0:.001:20;
F1hat=1;
F2hat=1.5;
t1=.1;
t2=4;
eps=0.2;
M=1;
for i=1:size(t,2)
    x1(i)=F1hat/M*Heaviside(t(i)-t1)*Step(t(i),t1);
    x2(i)=F2hat/M*Heaviside(t(i)-t2)*Step(t(i),t2);
end
plot(t,x1,t,x2,t,x1+x2);

% Compare to RK Solution

options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4],'MaxStep',.0003);
[TL,YL]=ode45(@impulsedot,[0 20],[0 0],options);
plot(TL,YL(1:end,1),t,x1+x2);
return
