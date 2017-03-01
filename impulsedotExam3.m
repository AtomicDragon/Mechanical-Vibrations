%Impulse Dot

function dy=impulsedotExam3(t,x)
    global zeta omegan eps t0 F1hat M;
    dy=zeros(2,1);
    dy(1)=x(2);
    dy(2)=-2*zeta*omegan*x(2)-omegan^2*x(1)+...
        (F1hat/(2*eps*M))*Dirac(t,t0,eps);
        
end
