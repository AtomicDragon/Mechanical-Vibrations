%forcedundampeddot
function dy=forcedundampeddot(t,x)
global omegan omegaf mo;
dy = zeros(2,1);
dy(1)= x(2);
dy(2)= mo*cos(omegaf*t)-omegan^2*x(1);
end