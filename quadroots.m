%Funcion to return polynomail roots using the quadratic formula
%Alex Stein Homework 1
function [root1,root2] = quadroots(a,b,c)
if (a==0)
    if (b==0)
        disp('Not a valid function');
        root1 = NaN
        root2 = NaN
    else
        root1 = -c/b
        root2 = NaN
    end
else
    root1 = (-b+sqrt(b^2-(4*a*c)))/(2*a);
    root2 = (-b-sqrt(b^2-(4*a*c)))/(2*a);
end
