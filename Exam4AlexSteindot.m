%Square wave function
function y=Exam4AlexSteindot(t)
global T;
y=zeros(size(t));
for i=1:size(t,1)
     if mod(t(i),T) <= 3.4826 
       y(i)=5;
    else 
       y(i)=5-(5/(6-3.4826))*(mod(t(i),T)-3.4826);
    end
 end

end