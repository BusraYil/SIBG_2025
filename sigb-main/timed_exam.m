%% Question 1.a - right
clf
clear

fs = 8000;
t  = 0 : 1/fs : 1;

x = sin(2*pi*1000*t) + 2.*sin(2*pi*1500*t);

x = upsample(x, 3);
avansfftplot(x, fs*3);

%% Question 1.b - right
% no, no, no, no, no, no

%% Question 1.c - right
% 6 bits = 2^6
clf
clear

ans = 0.5 * (1/(2^6));
% 0.0078 * 100 = 0.78%

%% Question 2.a - right
% Recursive, Causaal

%% Question 2.b - right
clf
clear

% y[n] = 2∙x[n] - 1.1∙y[n-1]

n0 = 2;
n1 = -2.2;
n2 = 2.42;
n3 = -2.662;
n4 = 2.9282;

ans = -1.1*n3;
% ans: 2, -2.2, 2.42, -2.662, 2.9282;

%% Question 3.a & 3.b - right
clf
clear

fs = 8000;
t  = 0 : 1/fs : 1;

y = 4 + sin(2*pi*t/8) + 2.*cos(2*pi*t/16);
plot(y);

% ans.a: 16 samples;
% ans.b: 6.5549;

%% Question 4 - right
clf
clear

fs = 8000;
t  = 0 : 1/fs : 1;

H = [ zeros(1, 3), ones(1, 1) ];
H = [ H fliplr(H) ];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

subplot(2,1,1);
avansfftplot([h zeros(1,1000)], fs);

subplot(2,1,2);
phasez(h);

%% Question 5.a & 5.b - right
clf
clear

[signal, fs] = audioread("resources/sine.wav");
% ans.a: 6000 Hz

x = upsample(signal, 4);

avansfftplot(x, fs*4);
% ans.b: ^

%% Question 6 - right
% remove second note = 660 hz;
% fs = 8000;
clf
clear

[signal, fs] = audioread("resources/chime.wav"); % written

subplot(2,2,1);
spectrogram(signal, hanning(1000));

subplot(2,2,3);
avansfftplot(signal, fs);

H = [ ones(1,600) zeros(1,120) ones(1,3280) ]; % written
H = [ H fliplr(H) ]; % written
H = H(1:length(H)-1); % written

h = ifft(H); % written
h = fftshift(h); % written

new = conv(signal, h); % written

subplot(2,2,2);
spectrogram(new, hanning(1000));

subplot(2,2,4);
avansfftplot(new, fs);

%% Question 7 - right
clf
clear

fs = 8000; % written
t  = 0:1/fs:0.5; % written

x = sin(2*pi*1000*t); % written
silence = zeros(1, 4000); % written

signal = [ x silence x silence ]; % written

subplot(2,1,1);
plot(signal);

subplot(2,1,2);
avansfftplot(signal, fs);

%% Question 8.a & 8.b - right
clf
clear

% y[n] = x[n] + -0.7y[n-1] + -0.7y[n-2]

n0 = 1;
n1 = -0.7;
n2 = -0.21;
n3 = 0.637;
n4 = -0.2989;

ans = -0.7.*n3 + -0.7.*n2;
% ans.a: 1, -0.7, -0.21, 0.637, -0.2989;

H = [ n0 n1 n2 n3 n4 ];
H = [ H fliplr(H) ];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

avansfftplot([h zeros(1,1000)]);
% ans.b: band-pass (guess)

%% Question 9 - wrong (no calculation)

% 1, 0

%% Question 10.a & 10.b - right
% ans.a: 01.010110;
% ans.b: 1.3438;
