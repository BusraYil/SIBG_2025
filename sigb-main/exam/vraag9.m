
[x, fs] = audioread("vraag9.wav");

subplot(2,2,1);
spectrogram(x, hanning(1000));

subplot(2,2,2);
avansfftplot(x, fs);

H = [ zeros(1,500) ones(1,300) zeros(1,200) ones(1,100) zeros(1,2900) ];
H = [ H fliplr(H) ];
H = H(1:length(H)-1);

h = ifft(H);
h = fftshift(h);

signal = conv(x, h);

subplot(2,2,3);
spectrogram(signal, hanning(1000));

subplot(2,2,4);
avansfftplot(signal, fs);

%audiowrite("vraag9_filtered.wav", signal, fs);