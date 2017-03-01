%Test Plot Free
%Alex Stein

t=0:.01:20;
K=4;
J=1;
theta0 =1;
omega0=0;
for C=10:-.05:.01
    PlotFree
    drawnow
    pause (0.25)
end