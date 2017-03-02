% Frequency Extractor
% Perform fourier transform on a vector of data and extract
% the dominant freqeuncy, plot the data and a simulated cosine wave at
% the detected frequency for visual comparison

% Assume two files of 1000 points each are saved.  Concatenate these two
% files to produce a vector theta that has 2000 points to use in FFT
load('GroupDProjectBAfterFrontTop2.mat')
theta=Trace_1(1:end,2);
deltat=Trace_1(2,1)-Trace_1(1,1);
t(1)=0;
for i=2:size(theta,1)
    t(i)=t(i-1)+deltat;
end
%  plot(t,theta)
%  return
pow=10;
N=2^pow; % This means 2048 data points 

samplerate=1/deltat;
f=samplerate*(0:(N/2))/N; %associated frequency vector
y=fft(theta);
clf;
subplot(2,1,1);
plot(f(10:150),abs(y(10:150))); % I am only plotting the first 80 frequencies
% for the DAP2 apparatus.  The ski, however, may have frequencies higher
% than the first 80, so you may need to change this number when analyzing
% ski data
[m,k]=max(abs(y(10:150)));
omegaf=f(k+9);
title(['FFT result: peak Omegaf = ',num2str(omegaf)]);
subplot(2,1,2);
plot(t,theta,t,max(theta)*cos(omegaf*2*pi*t));
legend('Experimental Data', 'Cosine @ omegaf')