%Group D Project 1 Back Push Down
%Alex and Briana
load('GroupDBackPushDown.mat')
zeroTime = 20001;
zeroVoltage = Trace_1(end,2);
Trace_1(1:end,1)= Trace_1(1:end,1)-.02;
Trace_1(1:end,2)= Trace_1(1:end,2)-zeroVoltage-.003;

J=1;
C=4.5; %Exponential
Mf=0.000005; %Linear
K=24674;
theta0=max(Trace_1(20001:end,2));
omega0=0;

tfinal = Trace_1(end,1);

Nsteps = 5000000;
deltat = tfinal/Nsteps;

%Data from Lab:
plot(Trace_1(zeroTime:end,1),Trace_1(zeroTime:end,2));
title('Trial BPD Experimental and Actual vs Time');
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