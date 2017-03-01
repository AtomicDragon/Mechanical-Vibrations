%Free Vibration Plotter
%Assume omegan,theta0, omega0, t

phi = atan(omegan*theta0/omega0);
A = sqrt(theta0^2*omegan^2+omega0^2)/omegan;
theta = A*sin(omegan*t+phi);
theta2 = B*sin(omegan*t)+C*cos(omegan*t);
plot(t,theta,t,theta2);
hl = legend('theta','theta2');