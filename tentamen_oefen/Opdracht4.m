fs = 8000; % Samplefrequentie
fc = 3000; % Afsnijfrequentie
N = 7; % Aantal coëfficiënten
b = fir1(N-1, fc/(fs/2), 'high', hamming(N)); % High-pass FIR-filter

% Frequentierespons plotten
figure;
%freqz(b,1,512,fs);
plot(b);
title('Frequentiekarakteristiek van het FIR-filter');
