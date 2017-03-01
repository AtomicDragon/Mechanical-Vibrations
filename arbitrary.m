%  Find Fourier equivalent to arbitrary function

function y=arbitrary(t)
global T;
y=zeros(size(t));
for i=1:size(t,1)
    ti=mod(t(i),T);
     if ti <= 0.6 
       y(i)=5-sqrt(ti);
    else 
       y(i)=5*ti.^2-2*ti;
     end
end
end