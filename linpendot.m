function dy=linpendot(t,y)
global omegan;
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -omegan^2*y(1);
end
