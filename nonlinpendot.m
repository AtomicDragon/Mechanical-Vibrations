function dy=nonlinpendot(t,y)
global omegan;
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -omegan^2*sin(y(1));
end


y(x)=(16*e^-x*x+4*pi^2*e^-x*x+32*e^-x)/((4+pi^2)^2)