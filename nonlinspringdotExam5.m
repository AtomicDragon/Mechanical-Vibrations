function dy=nonlinspringdotExam5(t,x)
global C M K LIM1;
dy = zeros(2,1);
dy(1) = x(2);
if (abs(x(1))<LIM1)
    dy(2) = -C/M*x(2);
else
    dy(2) = -C/M*x(2)-K/M*(abs(x(1))-LIM1)^3*sign(x(1));
end
end