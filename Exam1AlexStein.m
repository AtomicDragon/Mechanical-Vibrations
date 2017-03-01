% Exam1ReviewAlex.m
% Free Vibration Plotter
% Requires the variables:  J, K, C, t, theta0, omega0
% Alex Stein

clear;

%Part B
J = 14.826;
K = 20.4826;
C1 = 8;
C2 = 15;
C = C1+C2;
t=0:.001:10;
theta0 = .5;
omega0 = -.25;

%Part C
C1 = 20;
C = C1+C2;
omega0 = -.75;

%Part D
C1 = 8;
C= C1+C2;
omega0 = -.25;

K = K*100;
J = J*10;
t=0:0.001:40;

omegan=sqrt(K/J);
Ccr=2*sqrt(K*J);
zeta = C/Ccr;
clf;  % Clear the figure
if zeta > 1
     a1=(omega0+(zeta+sqrt(zeta^2-1))*omegan*theta0)/...
         (2*omegan*sqrt(zeta^2-1));
     a2=(-omega0-(zeta-sqrt(zeta^2-1))*omegan*theta0)/...
         (2*omegan*sqrt(zeta^2-1));
     lambda1=-zeta*omegan+omegan*sqrt(zeta^2-1);
     lambda2=-zeta*omegan-omegan*sqrt(zeta^2-1);
     term1=a1*exp(lambda1*t);
     term2=a2*exp(lambda2*t);
     theta_t=term1+term2;
     plot(t,theta_t);
     title(['Overdamped response ','Zeta = ', num2str(zeta)]);       
elseif (zeta == 1)
    a1=theta0;
    a2=omegan*theta0+omega0;
    theta_t=a1*exp(-omegan*t)+a2*t.*exp(-omegan*t);
    plot(t,theta_t);
    title('Critically Damped');
else    
    omegad=omegan*sqrt(1-zeta^2);
    A2=theta0;
    A1=(omega0+theta0*omegan*zeta)/omegad;
    theta_t=exp(-zeta*omegan*t).*(A1*sin(omegad*t)+...
        A2*cos(omegad*t));
    plot(t,theta_t);
    title(['Underdamped response ','Zeta = ', num2str(zeta)]);     
end
   
clf;
%Part b

plot(t, theta_t);
title('Displacement as a function of time');
disp(['The maximum displacement below 0 is ',num2str(min(theta_t))]);

%Part c

% plot(t, theta_t);
% crosszero = -1;
% for i=1:size(t,2)
%     if (theta_t(i) < 0)
%         if (crosszero == -1)
%             crosszero = t(i);
%         end
%     end
% end
% title('Displacement as a function of time');
% disp(['The cross zero time is ',num2str(crosszero),' and the omega0 is ',num2str(omega0)]);

%Part d

% %+/- 5 bar
% bar=ones(size(t))*theta0*.05;
% plot(t, theta_t,t,bar,t,-bar);
% title('Displacement as a function of time');
% h1= legend('theta1','bar1','bar2');
% for i=1:size(t,2)
%     if(theta_t(i)>bar(i))
%         tsettle=t(i);
%     end
% end
% disp(['The Settling time is ',num2str(tsettle)]);




