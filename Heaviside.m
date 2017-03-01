%Heaviside Function
function y=Heaviside(t)
global omegan zeta omegad

y=1/omegad*exp(-zeta*omegan*t).*sin(omegad*t);
end
    