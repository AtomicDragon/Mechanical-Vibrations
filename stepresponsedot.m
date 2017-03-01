%Step Dot

function dy=stepresponsedot(t,x)
    global zeta omegan f0 t0;
    dy=zeros(2,1);
    dy(1)=x(2);
    dy(2)=-2*zeta*omegan*x(2)-omegan^2*x(1)+...
        f0/M*Step(t,t0);
end
