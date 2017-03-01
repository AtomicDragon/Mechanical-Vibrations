function dy=nonlinspringdot(t,x)
global C M K1 K2 LIM1 F0 omegat;
dy = zeros(2,1);
dy(1) = x(2);
if (abs(x(1))<LIM1)
    dy(2) = -C/M*x(2)-K1/M*x(1)+F0/M*cos(omegat*t);
else
    dy(2) = -C/M*x(2)-K1/M*x(1)-...
        K2/M*(abs(x(1))-LIM1)^3*sign(x(1))+F0/M*cos(omegat*t);
end
end