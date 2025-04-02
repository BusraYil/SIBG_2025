
fs = 8000;
t  = 0 : 1/fs : 1;

x = sin(2*pi*1000*t) + 2*sin(2*pi*3000*t) + 3*sin(2*pi*6000*t);

x = upsample(x, 3);

avansfftplot(x, fs*3);

%%

fs = 8000;
t  = 0 : 1/fs : 1;

x = sin(2*pi*1500*t) + 2*sin(2*pi*3000*t);

signal = interp(x, 2);

avansfftplot(signal, fs*2);

%%

fs = 8000;
t  = 0 : 1/fs : 1;

h = [ 5 0 -15 30 -15 0 5 ];

H = fft([h zeros(1,1000)]);

subplot(2,1,1);
plot(abs(H));

subplot(2,1,2);
plot(angle(H));

%%

H = [ 5 0 -15 30 -15 0 5 ];
H = [ H fliplr(H) ];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

subplot(2,1,1);
avansfftplot([h zeros(1,1000)], fs);

subplot(2,1,2);
phasez(h);

