%Impulse Dot

function dy=impulsedot(t,x)
    global zeta omegan eps t1 t2 F1hat F2hat M;
    dy=zeros(2,1);
    dy(1)=x(2);
    dy(2)=-2*zeta*omegan*x(2)-omegan^2*x(1)+...
        (F1hat/(2*eps*M))*Dirac(t,t1,eps)+...
        (F2hat/(2*eps*M))*Dirac(t,t2,eps);
end
