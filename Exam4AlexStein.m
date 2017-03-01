% Alex Stein Exam 4
% Find the fourier coefficents for given wave

%Define the period
global T
T=6; % seconds
omegat=2*pi/T;
t0=0;
n=10;
count=1;

for n=[10,20,40]
t=[0:.01:T]';
% plot(t,Exam4AlexSteindot(t));
% return

%Define a variable function
f = @(x) Exam4AlexSteindot(x);
X=integral(f,t0,T,'ArrayValued',true);
% plot(t,f(t),t,X)

a0=2/T*X;
%Find Fourier coefficients
for i=1:n
f=@(x) Exam4AlexSteindot(x).*cos(i*omegat*x);
X=integral(f,t0,T,'ArrayValued',true);
a(i)=2/T*X;
end

for i=1:n
f=@(x) Exam4AlexSteindot(x).*sin(i*omegat*x);
X=integral(f,t0,T,'ArrayValued',true);
b(i)=2/T*X;
end

t=[0:.01:3*T]';
%Build the resulting function
fn=ones(size(t))*a0/2;
%Start with a vector of a0 and then accumulate each term
for i=1:n
    for j=1:size(t,1)
        fn(j)=fn(j)+a(i)*cos(i*omegat*t(j))+...
        b(i)*sin(i*omegat*t(j));
    end
end

subplot(3,1,count);
plot(t,fn,t,Exam4AlexSteindot(t))
title(['Exam4AlexSteindot Function with n= ',num2str(n)])
xlabel('Time')
ylabel('Force')
legend(['n= ',num2str(n)],'Theoretical')
count=count+1;
end
hold off


