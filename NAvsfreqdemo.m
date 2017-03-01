%NA vs Frequency Ratio Demo

clf;
r=[0:.01:5]';

zeta=0.04;

for i=1:9
    labels(i,:)=char(num2str(zeta)); %Create a matrix of strings
    NA(:,i)=1.0./sqrt((1-r.^2).^2+(2*zeta*r).^2);
    Betas(:,i)=atan2(2*zeta*r,(1-r.^2));
    zeta = zeta+.05;
end
subplot(2,1,1)
plot(r,NA);
legend(labels);
title('Normalized Amplitude versus Frequency Ratio');
xlabel('r');
ylabel('NA');

subplot(2,1,2)
plot(r,Betas);
title('Phase Angle versus Frequency Ratio');
xlabel('r');
ylabel('Beta');