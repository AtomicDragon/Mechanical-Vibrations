% Fourier Complete
% FInd the fourier coefficents for squarewave wave

%Define the period
global T zeta omegan M
T=5; % seconds
omegat=2*pi/T;
t0=0;
m=3;
n=25;

% for n=2:20
t=[0:.01:T]';
% plot(t,squarewave(t));
% return

%Define a variable function

f = @(x) squarewave(x);
X=integral(f,t0,T,'ArrayValued',true);

% plot(t,f(t),t,X)

a0=2/T*X;
%Find Fourier coefficients
for i=1:n
f=@(x) squarewave(x).*cos(i*omegat*x);
X=integral(f,t0,T,'ArrayValued',true);
a(i)=2/T*X;
end

for i=1:n
f=@(x) squarewave(x).*sin(i*omegat*x);
X=integral(f,t0,T,'ArrayValued',true);
b(i)=2/T*X;
end

%Build the resulting function

fn=ones(size(t))*a0/2;
%Start with a vector of a0 and then accumulate each term
for i=1:n
    for j=1:size(t,1)
        fn(j)=fn(j)+a(i)*cos(i*omegat*t(j))+...
        b(i)*sin(i*omegat*t(j));
    end
end

% plot(t,fn,t,squarewave(t))
% drawnow
% pause (1)
% end

% plot(b)

%Find steady-state particular solution for 2nd order system with 
K=1;
zeta=0.2;
M=0.01;
omegan=sqrt(K/M);
t=[0:.1:3*T]';% t for plotting three periods not for computing the fourier coefficents

for i=1:n
    Beta(i)=atan2(2*zeta*omegan*i*omegat,(omegan^2-(i*omegat)^2));
end
% Fill up a vector of steady-state terms

Xcn=ones(size(t))*a0/2/K;
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

% plot(t,squarewave(t),t,Xcn+Xsn);

% Compare to RK Simulation
options=odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4],'MaxStep',.0003);
[TL,YL]=ode45(@squarewaveresponsedot,[0 3*T],[4 0],options);
plot(TL,YL(1:end,1),t,Xsn+Xcn);
legend('y-rk','x')
