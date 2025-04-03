%%
[x, fs] = audioread('sigb-main/sine.wav');
y = upsample(x, 2);

N = length(y);
f = linspace(0, fs*2, N);
Y = abs(fft(y));
plot(f(1:N/2), Y(1:N/2));
xlabel('Frequentie (Hz)');
ylabel('Amplitude');
title('Frequentierespons na upsampling');
