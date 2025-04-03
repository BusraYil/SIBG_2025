% Definieer de nieuwe filtercoëfficiënten
b = [1];         % Coëfficiënten van x[n] (noemer)
a = [1 -1/3 -1/3]; % Feedback-coëfficiënten (teller)  dit is 1/3

% Impulsresponsie berekenen
impuls = [1; zeros(9,1)]; % Eenheidsimpuls (delta-functie)
h = filter(b, a, impuls); % Impulsresponsie berekenen

% Plot de impulsresponsie
figure;
stem(h, 'filled');
title('Impulsresponsie van het filter met feedback-coëfficiënt 1/3');
xlabel('n');
ylabel('h[n]');
grid on;

% Frequentieresponsie berekenen en plotten
figure;
freqz(b, a, 512, 'whole'); 
title('Frequentiekarakteristiek van het filter (1/3 feedback)');
xlabel('Frequentie (Hz)');
ylabel('Amplitude en Fase');

% Toon de eerste vijf waarden van de impulsresponsie
disp('De eerste vijf waarden van de impulsresponsie:');
disp(h(1:5));
