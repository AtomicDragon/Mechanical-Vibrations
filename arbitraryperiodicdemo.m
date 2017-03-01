% Compute the second order system response to an arbitrary periodic
% wave using the Fourier Series approximation to the wave

global T M zeta omegan;

T=2;
m=6;
n=20;
omegat=2*pi/T;
t0=0;

%  Needs to be T only, do not set to 2*T or 3*T for plotting, this
%   will cause the a's and b's to be 3* too big.
t=[0:0.01:T]';
%   plot(t,arbitrary(t));
%   return


 f= @(x) arbitrary(x);
 X=integral(f,t0,T,'ArrayValued',true);
%  plot(t,f(t))
% return
a0=2/T*X;
% plot(t,f(t),t,a0) 
%  return

for i=1:n
    f= @(x) arbitrary(x).*cos(i*omegat*x);
  X=integral(f,t0,T,'ArrayValued',true);
  a(i)=2/T*X;
end
return
for i=1:n
  
  f= @(x) arbitrary(x).*sin(i*omegat*x);
  X=integral(f,t0,T,'ArrayValued',true);
  b(i)=2/T*X;
 end

% This makes a matrix the size of t filled with all ones
% then multiplies by a0/2 to make all the starting values the constant
% a0/2.  Then the 'n' sucessive cosine and sine waves are added in on top
% the constant a0/2 to preduce the total wave that gets closer and 
% closer to the arbitrary wave the more terms I add

fn=ones(size(t))*a0/2;

for i=1:n
  for j=1:size(t,1)
  fn(j)=fn(j)+a(i)*cos(i*omegat*t(j))+b(i)*sin(i*omegat*t(j)); 
  end
end
% This plot shows the arbitray wave and the Fourier approximation of
% the wave
% Particular solution
K=1;
zeta=0.2;
M=0.01;
omegan=sqrt(K/M);
%Time function for plotting
t=[0:0.1:3*T]';
% Find phase angle for each frequency n*omegat
for i=1:n
  Beta(i)=atan2(2*zeta*omegan*omegat*i,omegan^2-(i*omegat)^2);
end

% Add together all the responses to all the sin and cosine waves,
% this approximates the total response to the arbitrary wave

Xcn=ones(size(t))*a0/(2*K);

for i=1:n
  for j=1:size(t,1)
  Xcn(j)=Xcn(j)+a(i)/M*cos(i*omegat*t(j)-Beta(i))/...
  sqrt((omegan^2-(i*omegat)^2)^2+(2*zeta*omegan*i*omegat)^2);
  end
  
end

Xsn=zeros(size(t));

for i=1:n
  for j=1:size(t,1)
  Xsn(j)=Xsn(j)+b(i)/M*sin(i*omegat*t(j)-Beta(i))/...
  sqrt((omegan^2-(i*omegat)^2)^2+(2*zeta*omegan*i*omegat)^2);
  end
end

x0=15;
v0=0;
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
[TL,YL] = ode45(@arbitrarydot,[0 3*T],[x0 v0],options);
plot(t,arbitrary(t),t,Xsn+Xcn,TL,YL(:,1));
legend('arbitrary', 'Fourier','RK')