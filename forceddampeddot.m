%forcedundampeddot
function dy=forceddampeddot(t, x)
    global omegan omegaf mo zeta;
    dy = zeros(2,1);    % a 2x1 column vector
    dy(1)=x(2);
    dy(2)=mo*cos(omegaf*t)-2*zeta*omegan*x(2)-omegan^2*x(1);
end