%sawtooth function
function y=sawtooth(t)
global T
if t<=T
    y=t/T;
else
    y=mod(t,T)/T;
end

end