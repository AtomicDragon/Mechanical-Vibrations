%Sawtooth Dot

function dy=sawtoothresponsedot(t,x)
    global zeta omegan M;
    dy=zeros(2,1);
    dy(1)=x(2);
    dy(2)=-2*zeta*omegan*x(2)-omegan^2*x(1)+...
        sawtooth(t)/M;
end
