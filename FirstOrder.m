%FirstOrder
tfinal = 10;
t=0:.01:tfinal;
a = .25;
x0=1;
%Theoretical Solution
x = x0*exp(-a*t);
plot(t,x);

hold on;

%Euler solution
Nsteps = 50000;
deltat = tfinal/Nsteps;
x_e(1) = x0;
t_e=0:deltat:tfinal;
for i= 1:Nsteps
    x_e(i+1)=x_e(i)-a*x_e(i)*deltat;
end
plot(t_e,x_e);
hold off;