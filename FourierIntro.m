% FourierIntro.m
% Demonstrate the principle of orthoganality

% Define the period
T=5;%seconds
omegat=2*pi()/T;
t0=0;
m=6;
n=3;
t=sym('t');

% for n=1:20
% % f=sin(m*omegat*t).*sin(n*omegat*t);
% % f=sin(m*omegat*t).*cos(n*omegat*t);
% % f=cos(m*omegat*t).*cos(n*omegat*t);
% ezplot(f,[t0 T]);
% drawnow
% pause(.5)
% end

for n=1:20
    m=n;
% f=sin(m*omegat*t).*sin(n*omegat*t);
% f=sin(m*omegat*t).*cos(n*omegat*t);
f=cos(m*omegat*t).*cos(n*omegat*t);
X=int(f,t);
subplot(2,1,1)
ezplot(f,[t0 T]);
subplot(2,1,2)
ezplot(X,[t0 T]);
drawnow
pause(1);
end