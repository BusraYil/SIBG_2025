%% Question 1.a - right
clf
clear

fs = 8000;
t = 0 : 1/fs : 1;

x = 1.*sin(2*pi*1000*t) + 2.*sin(2*pi*1500*t);
x = upsample(x, 3);

avansfftplot(x, fs*3);

%% Question 1.b - right
% No

%% Question 1.c - right
clear

x = 2^6;
y = 0.5 * 1/x * 100;
% 0.7813% afrondingsfout

%% Question 2.a - wrong (causal, recursive)
% Recursive, stable

%% Question 2.b - wrong (checked)
clear

% if 'b' do once, otherwise use 'a'
% y[n] = 2*x - 1.1*y[n-1]
% n = [1 1 1 1 1]

n0 = 2;
n1 = -2.2;
n2 = 2.42;
n3 = -2.662;
n4 = 2.9282;

answer = -1.1.*n3;

%% Question 3.a - right & 3.b - right
clear

fs = 8000;
t = 0 : 1/fs : 1;

y = 4 + sin(2*pi*t/8) + 2.*cos(2*pi*t/16); % actually copy the function lmao

plot(y);
max = max(y);
% periode   = 16 (see cos)
% max value = 6.5981

%% Question 4 - right
clear

fs = 8000;

H = [ zeros(1, 3) ones(1,1) ];
H = [H fliplr(H)];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

subplot(2,1,1);
avansfftplot([h zeros(1,1000)], fs) % amplitude of the spectrum

subplot(2,1,2);

%H = fft([h, zeros(1,1000)]);
%plot(angle(H)); % phase of the spectrum
phasez(h);

%% Question 5.a - right
clear

[signal, fs] = audioread("resources\sine.wav");
% fs = 6000;

%% Question 5.b - right
clf
clear

[signal, fs] = audioread("resources\sine.wav");
x = upsample(signal, 2);

x = upsample(x, 2);
avansfftplot(x, fs*4);

%% Question 6 - right
clf
clear

[signal, fs] = audioread("resources\chime.wav");

H = [ ones(1, 600) zeros(1,120) ones(1, 3280)];
H = [ H fliplr(H)];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

x = conv(signal, h);

subplot(2,2,1);
spectrogram(signal, hanning(1000));

subplot(2,2,2);
spectrogram(x, hanning(1000));

subplot(2,2,3);
avansfftplot(signal, fs);

subplot(2,2,4);
avansfftplot(x, fs);

sound(x, fs);

%% Question 7 - right
clf
clear

fs = 8000;
t = 0:1/fs:0.5;

x = sin(2*pi*1000*t);
silence = zeros(1,4000);

signal = [x silence x silence];

subplot(2,1,1);
avansfftplot(signal, fs);

subplot(2,1,2);
plot(signal);

%% Question 8.a - right
clf
clear

%f[n] = x[n] +- 0.7 .* y[n] +- 0.7 .* y[n-1]; 
%n = [1 1 1 1 1]

n0 = 1;
n1 = -0.7;
n2 = -0.21;
n3 = 0.637;
n4 = -0.2989;

answer = -0.7.*n3 +- 0.7.*n2;

%% Question 8.b - right
clf
clear

x = ones(1, 100);
h = [1 -0.7, -0.21, 0.637, -0.2989];
y = conv(x, h);

avansfftplot(y);

% band-pass
% See presentation 6, slide 21

%% Question 9

% math.

%% Question 10.a & 10.b - right
clf
clear

ans1 = (0.35 .* 2^6); % 22
% 1.35b = 01.010110(Q2.6)

ans2 = single(1 + 22 / 2^6); % 1.3438


