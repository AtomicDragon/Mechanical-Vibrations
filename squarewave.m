%Square wave function
function y=squarewave(t)
global T;
y=zeros(size(t));
for i=1:size(t,1)
     if mod(t(i),T) <= T/2 
       y(i)=2;
    else 
       y(i)=4;
    end
 end

end