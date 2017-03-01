% Create dot functions for linear and
% nonlinear dyanmics

function xdot = squarewaveresponsedot(t,x)
global M zeta omegan;
  xdot=ones(2,1);
  xdot(1)=x(2);
  xdot(2)=-2*zeta*omegan*x(2)-omegan^2*x(1)+squarewave(t)/M;
end