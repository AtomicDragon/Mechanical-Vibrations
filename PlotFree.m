% PlotFree.m
% Free Vibration Plotter
% Requires the variables:  J, K, C, t, theta0, omega0
% Alex Stein

    omegan=sqrt(K/J);
    Ccr=2*sqrt(K*J);
    zeta = C/Ccr;
    clf;  % Clear the figure
    if zeta > 1
         a1=(omega0+(zeta+sqrt(zeta^2-1))*omegan*theta0)/...
             (2*omegan*sqrt(zeta^2-1));
         a2=(-omega0-(zeta-sqrt(zeta^2-1))*omegan*theta0)/...
             (2*omegan*sqrt(zeta^2-1));
         lambda1=-zeta*omegan+omegan*sqrt(zeta^2-1);
         lambda2=-zeta*omegan-omegan*sqrt(zeta^2-1);
         term1=a1*exp(lambda1*t);
         term2=a2*exp(lambda2*t);
         theta_t=term1+term2;
         plot(t,theta_t);
         title(['Overdamped response ','Zeta = ', num2str(zeta)]);       
    elseif (zeta == 1)
        a1=theta0;
        a2=omegan*theta0+omega0;
        theta_t=a1*exp(-omegan*t)+a2*t.*exp(-omegan*t);
        plot(t,theta_t);
        title('Critically Damped');
    else    
        omegad=omegan*sqrt(1-zeta^2);
        A2=theta0;
        A1=(omega0+theta0*omegan*zeta)/omegad;
        theta_t=exp(-zeta*omegan*t).*(A1*sin(omegad*t)+...
            A2*cos(omegad*t));
        plot(t,theta_t);
        title(['Underdamped response ','Zeta = ', num2str(zeta)]);     
    end
   












