% Session 4, convolution & filters

h = [1 2 1];
x = [2 1];

y = conv(x, h);
%%

x = [9 10 8 10 12 11 9 11 10 16 18 18 14 22 12 15 11 10 9 10 16 17 18 14 9 11 7 8 9 11];

h = [ones(1, 7)] / 7;

y = conv(x, h);

stem(x, 'r.');

hold on;
stem(y, 'b.');
hold off;

%%

[train, fs] = audioread('resources/train.wav');

subplot(2,1,1);
spectrogram(train, hanning(1000));

% low-pass filter apparently
lp=[-0.1110 0.1024 0.1372 0.1849 0.2238 0.2386 0.2238 0.1849 0.1372 0.1024 -0.1110];

y=conv(train,lp);
subplot(2,1,2);
avansfftplot(y, fs);

