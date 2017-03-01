function dy=nonlindampdot(t,x)
global C M K1 F0 omegat;
dy = zeros(2,1);
dy(1) = x(2);
dy(2) = -C/M*(x(2)^2)*sign(x(2))-K1/M*x(1)+F0/M*cos(omegat*t);
end