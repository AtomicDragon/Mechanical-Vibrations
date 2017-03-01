function y=arbitrary7_2(t)
global T;
y=zeros(size(t));
for i=1:size(t,1)
    ti=mod(t(i),T);
     if ti <= 0.1 
       y(i)=4.826-sqrt(ti);
    else 
       y(i)=4.826*ti.^3+log(ti);
     end
end
end