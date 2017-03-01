% Exam1ReviewAlex.m
% Free Vibration Plotter
% Requires the variables:  J, K, C, t, theta0, omega0
% Alex Stein

%Part A
J = 14.826;
K1 = 200;
K2 = 150;
K = K1+K2;
C1 = 5;
C2 = 12;
C = C1+C2;
t=0:.001:10;
theta0 = .1;
omega0 = .5;
% %Part B
% Ccr=2*sqrt(K*J);
% C1 = Ccr-C2;
% C = C1+C2;
% %Part C
% C1 = 5;
% C2 = 12;
% C = C1+C2;
% K1 = 200/100;
% K2 = 150/100;
% K = K1+K2;

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
%Part a

plot(t, theta_t);
title('Displacement as a function of time');
disp(['The maximum displacement is ',num2str(max(theta_t))]);

%Part b

% +/- 2% bar
% bar=ones(size(t))*theta0*.02;
% plot(t, theta_t,t,bar,t,-bar);
% title('Displacement as a function of time');
% 
% for i=1:size(t,2)
%     if(theta_t(i)>bar(i))
%         tsettle=t(i);
%     end
% end
% disp(['The Settling time is ',num2str(tsettle)]);

%Part c
% 
% plot(t,term1,t,term2,t,term1+term2);
% legend('First pole','Second pole','Total pole');
% disp(['The dominant pole is ',num2str(lambda1)]);



