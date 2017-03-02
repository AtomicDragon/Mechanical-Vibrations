%Group D Project B Before Back Bottom
%Alex and Briana
load('GroupDProjectBBeforeBackTop.mat')
Trace_1(1:end,2)= Trace_1(1:end,2)-mean(Trace_1(1:end,2));

timeAtMax=0;
maxTheta=0;
iAtMax=0;
for i=27:size(Trace_1)
    if(abs(Trace_1(i,2))> abs(maxTheta))
        maxTheta=Trace_1(i,2);
        timeAtMax=Trace_1(i,1);
        iAtMax=i;
    end
end
Trace_1(1:end,1)= Trace_1(1:end,1)-timeAtMax;

J=1;
C=0.4; %Exponential
Mf=0.05; %Linear
K=4152;
theta0=maxTheta-.002;
omega0=0;

tfinal = Trace_1(end,1);

Nsteps = 5000000;
deltat = tfinal/Nsteps;

%Data from Lab:
plot(Trace_1(iAtMax:end,1),Trace_1(iAtMax:end,2));
title('Trial BBT Experimental and Actual vs Time');
hold on;

theta_e(1)=theta0;
omega_e(1)=omega0;
t_e=0:deltat:tfinal;
for i=1:Nsteps
    omega_e(i+1)= omega_e(i)-Mf/J*deltat*sign(omega_e(i))-K/J*deltat*theta_e(i)-C/J*deltat*omega_e(i);
    theta_e(i+1)= theta_e(i)+omega_e(i)*deltat;
end
plot(t_e,theta_e);
h1= legend('actual','theoretical');
hold off;

return
t=Trace_1(:,1)-Trace_1(1,1);
y=Trace_1(:,2)-mean(Trace_1(:,2));

omegat=1.0;
i=1;
for omegat=50:.2:70
prod=y.*cos(omegat*t);
% subplot(2,1,1)
% plot(t,y,t,cos(omegat*t),t,prod,'LineWidth',1.5)
% legend('Signal','Trial wave','Product')
% subplot(2,1,2)
% plot(t,ones(size(t,1))*sum(prod))
powz(i)=sum(prod);
omeg(i)=omegat;
i=i+1;
% drawnow
% pause(0.01);
end
figure(2)
plot(omeg,abs(powz))
title('Sum of the product for various frequencies')