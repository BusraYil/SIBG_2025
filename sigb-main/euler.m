%% Session 5, Euler in matlab
% Euler in a graph
c = 3 + 4j;

plot(c, 'ok');
axis([-5 5 -5 5]);

d = 1 - 2j;

e = c + d;

hold on;
plot(d, 'ok');

plot(e, 'or');
hold off;

%%
% using complex vectors, aka giving them an actual line
c = [0 3+4j];

plot(c, 'k');
axis([-5 5 -5 5]);

d = [0 1-2j];
e = [0 c+d];

hold on;
plot(d, 'k');
plot(e, 'r');
hold off;

%%
% euler as cosine/sine
fs = 8000;
t = 0 : 1/fs : 1;

x = exp(2 * pi * 1j * 400 * t);

% Imaginary parts of complex X and/or Y arguments ignored.
%plot(x, fs);

subplot(3,1,1);
plot(x);
title("signal");

subplot(3,1,2);
stem(real(x));
title("Real X");

subplot(3,1,3);
stem(imag(x));
title("Imag X");

%%
% figuring out the frequencies using cos multiplications
[x, fs] = audioread('resources\test.wav');
t = 0 : 1/fs : 3;

subplot(3,2,1);
plot(x);

subplot(3,2,3);
avansfftplot(x, fs);

subplot(3,2,5);
spectrogram(x, hanning(1000));

xSum = sum(x);
xLength = length(x);

% cos calculation
y = x .* cos(700);

subplot(3,2,2);
plot(y);

subplot(3,2,4);
avansfftplot(y, fs);

subplot(3,2,6);
spectrogram(y, hanning(1000));

ySum = sum(y);
yLength = length(y);

%%
% Discrete fourier transform

% x = time-domain
x1 = [2.5 2 1 0 -1 -2 -2.5 -2 -1 0 1 2];    % cosinus
x2 =[0 1 2 2.5 2 1 0 -1 -2 -2.5 -2 -1];     % sinus
% X = frequency-domain
X = fft(x2);

subplot(3,1,1); 
stem(x2); 
title('Time');

subplot(3,1,2); 
stem(real(X)); 
title('Real X');

subplot(3,1,3); 
stem(imag(X)); 
title('Imag X');

%%
% Interpretation of discrete fourier transform

fs  = 8000;
t   = 0:1/fs:1;

x1 = [ ones(1,10) zeros(1,10) ];
x2 = [ ones(1,10) -ones(1,10) ];

x3 = [x1 x1];

subplot(3,2,1);
avansfftplot(x1, fs);
title("x1");

subplot(3,2,2);
stem(x1);

subplot(3,2,3);
avansfftplot(x2, fs);
title("x2");

subplot(3,2,4);
stem(x2);

subplot(3,2,5);
avansfftplot(x3, fs);
title("x3");

subplot(3,2,6);
stem(x3);

%%
