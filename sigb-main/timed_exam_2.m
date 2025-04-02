% Question 1

fs = 8000;
t  = 0 : 1/fs : 1;

x = sin(2*pi*1000*t) + 2*sin(2*pi*1500*t);

x = upsample(x, 3);

avansfftplot(x, fs*3);

%%

fs = 8000;
t = 0 : 1/fs : 1;

y = 4 + sin(2*pi*t/8) + 2*cos(2*pi*t/16);

plot(y);

%%

fs = 8000;
t = 0 : 1/fs : 1;

H = [ zeros(1, 3) ones(1, 1) ];
H = [ H fliplr(H) ];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

subplot(2,1,1);
avansfftplot(abs([h zeros(1,1000)]), fs);

H = fft([h zeros(1,1000)]);

subplot(2,1,2);
phasez(h);

%plot(angle(H));


%%

[x, fs] = audioread("resources\sine.wav");

x = upsample(x, 4);

avansfftplot(x, fs*4);

%% question 6

[x, fs] = audioread("resources\chime.wav");

subplot(2,2,1);
spectrogram(x, hanning(1000));

subplot(2,2,2);
avansfftplot(x, fs);

% 525 stay
% 660 gone
% 780 stay

H = [ ones(1, 550) zeros(1, 200) ones(1, 3250) ];

H = [ H fliplr(H) ];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

y = conv(x,h);

subplot(2,2,3);
spectrogram(y, hanning(1000));

subplot(2,2,4);
avansfftplot(y, fs);

sound(y, fs);

%% Question 7

fs = 8000;
t  = 0 : 1/fs : 0.5;

x = sin(2*pi*1000*t);
y = zeros(1, 4000);

signal = [x y x y];

plot(signal);

%%

01.010110

%% 

fs = 8000;
t = 0 : 1/fs : 4;

x = cos(2*pi*1000*t);
y = [zeros(1,fs) cos(2*pi*1500*t)];

y = y(1:length(x));

signal = x + y;

spectrogram(signal, hanning(1000));