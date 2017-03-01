function xdot=lin3dofdot(t,x)
global m1 m2 m3 k1 k2 k3 k4
  xdot = zeros(6,1);
  xdot(1)=x(2);
  xdot(2)=-(k1+k2+k4)/m1*x(1)+k2/m1*x(3)+k4/m1*x(5);
  xdot(3)=x(4);
  xdot(4)=-(k2+k3)/m2*x(3)+k2/m2*x(1)+k3/m2*x(5);
  xdot(5)=x(6);
  xdot(6)=-(k3+k4)/m3*x(5)+(k4)/m3*x(1)+k3/m3*x(3);
  
end