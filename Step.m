% Heaviside Step Function
function H=Step(t,tau)
    H = (t>=tau);
    %Logical true/false resolve to 1/0 when converted to a number
end
