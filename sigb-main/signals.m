% Session 1 - Generating signals
% Creating a basic signal

fs = 8000;                      % samplefrequency
t = 0 : 1/fs : 1;               % vector for time (1s)
y = sin(2 * pi * 1000 * t );    % generate the sin signal

plot(t, y);                     % plot the signal with x = t, y = y

axis([0 0.01 -1 1]);            % change axis limits to x:0->0.01 y:-1->1

%%
% Creating noise

fs = 8000;
t = 0 : 1/fs : 1;

r = 2 * rand(1, fs+1)-1;    % generate 8001 random numbers between -1 & 1
% 2 == amplitude, create a 1x8001 vector, add -1 to get rand num -1 -> 1

%%
% Loading audio fragments

% read audio from a local file:
[y, fs] = audioread("resources\chime.wav");

% write audio to the local file, using a given variable and its fs
% audiowrite('resources\same_audio.wav', y, fs);

%%
% Creating morse code

fs = 8000;
t1 = 0 : 1/fs : 0.25;
t2 = 0 : 1/fs : 0.75;

pause = zeros(1, 2000);
dot = sin( 2 * pi * 800 * t1);   % 1 seconds
line = sin( 2 * pi * 800 * t2);  % 3 seconds

A = [ dot pause line ];
V = [ dot pause dot pause dot pause line ];
N = [ line pause dot ];
S = [ dot pause dot pause dot ];

code = [ pause A pause V pause A pause N pause S ]; % add fragments together

noise = 2* rand(1, length(code)) - 1;

ww2code = code + (noise * 0.2);

% get 2 plots in the same figure
subplot(3,1,1); % 3 rows, 1 column, first position
plot(ww2code);

subplot(3,1,2); % 3 rows, 1 column, second position
avansfftplot(ww2code); % see frequency spectrum

subplot(3,1,3); % 3 rows, 1 column, third position
avansfftstem(ww2code);

% sound(ww2code, fs);

%%
% Creating a floating signal

fs = 8000;
t = 0 : 1/fs : 2;
x1 = sin(2*pi*500*t);
x2 = sin(2*pi*502*t);

togetha = x1 + x2;

subplot(2,1,1);
plot(togetha);

subplot(2,1,2);
avansfftplot(togetha);
