% Create dot functions for linear and
% nonlinear dyanmics
function xdot = arbitrary7_2dot(t,x)
global M zeta omegan;
  xdot=ones(2,1);
  xdot(1)=x(2);
  xdot(2)=-2*zeta*omegan*x(2)-omegan^2*x(1)+arbitrary7_2(t)/M;
end