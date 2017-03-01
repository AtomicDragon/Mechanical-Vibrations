%Free Vibration Plotter
%Assume omegan,theta0, omega0, t

phi = atan(omegan*theta0/omega0);
A = sqrt(theta0^2*omegan^2+omega0^2)/omegan;
theta = A*sin(omegan*t+phi);
omega = omegan*A*cos(omegan*t+phi);
alpha = -omegan^2*A*sin(omegan*t+phi);
plot(t,theta,t,omega,t,alpha);
hl = legend('theta','omega','alpha');