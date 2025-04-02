% Session 3, analysing signals

[y, fs] = audioread("resources\chime.wav");

subplot(4,2,1);
plot(y);

subplot(4,2,3);
avansfftplot(y, fs);

subplot(4,2,5);
pwelch(y);

subplot(4,2,7);
spectrogram(y, hanning(1000));

t = 0 : 1/fs : 2;
e = -t * 3;

x1 = sin(2*pi*533*t) .* exp(e);
x2 = sin(2*pi*660*t) .* exp(e);
x3 = sin(2*pi*784*t) .* exp(e);
x4 = sin(2*pi*1050*t) .* exp(e);

x1 = [ x1 zeros(1, fs.*3)];
x2 = [ zeros(1, fs) x2 zeros(1, fs.*2)];
x3 = [ zeros(1, fs.*2) x3 zeros(1, fs)];
x4 = [ zeros(1, fs.*3) x4];

chime = x1 + x2 + x3 + x4 ;

subplot(4,2,2);
plot(chime);

subplot(4,2,4);
avansfftplot(chime, fs);

subplot(4,2,6);
pwelch(chime);

subplot(4,2,8);
spectrogram(chime, hanning(1000));

sound(chime, fs);



