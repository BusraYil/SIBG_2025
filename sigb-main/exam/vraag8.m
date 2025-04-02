
fs = 8000;
t  = 0 : 1/fs : 0.5;

subsignal1 = sin(2*pi*2000*t).*t;
subsignal2 = fliplr(sin(2*pi*1000*t).*t);

silence = zeros(1,fs/2+1);
x1 = [ subsignal1 silence silence ]; % was moeilijk af te lezen van het spectrogram
x2 = [ silence silence subsignal2 ]; 

signal = x1 + x2;
