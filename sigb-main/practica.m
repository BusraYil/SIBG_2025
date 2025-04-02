% Example convolution

h = [1 2 1];
x = [2 1];

y = conv(x, h);
%%

x=[9 10 8 10 12 11 9 11 10 16 18 18 14 22 12 15 11 10 9 10 16 17 18 14 9 11 7 8 9 11];
h = [ ones(1, 7) ] / 7;

y = conv(x, h);

stem(x, "ob");
hold on;
stem(y, "or");
hold off;

%%
[signal, fs] = audioread("resources\train.wav");
lp=[-0.1110 0.1024 0.1372 0.1849 0.2238 0.2386 0.2238 0.1849 0.1372 0.1024 -0.1110];

y = conv(signal, lp);

% sound(y, fs);

plot(signal);
plot(y); % high frequency signals have been filtered out

%%
[chime,fs]=audioread('resources\chime.wav');

b=[-0.0380 -0.0409 -0.0270 0.0050 0.0517 0.1049 0.1543 0.1891 0.2017 ...
    0.1891 0.1543 0.1049 0.0517 0.0050 -0.0270 -0.0409 -0.0380];

y=conv(chime,b);
soundsc(y,fs);
avansfftplot(chime);
avansfftplot(y); % low-pass filter

