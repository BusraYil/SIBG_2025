% Definieer de filtercoëfficiënten
b = [1];         % Coëfficiënten van x[n] (noemer)
a = [1 0.7 0.7]; % Feedback-coëfficiënten (teller)

% Impulsresponsie berekenen
impuls = [1; zeros(9,1)]; % Eenheidsimpuls (delta-functie)
h = filter(b, a, impuls); % Impulsresponsie berekenen

% Plot de impulsresponsie
%figure;
%stem(h, 'filled');
%title('Impulsresponsie van het filter');
%xlabel('n');
%ylabel('h[n]');
%grid on;

% Frequentieresponsie berekenen en plotten
%figure;
%freqz(b, a, 512, 'whole'); 
%title('Frequentiekarakteristiek van het filter');
%xlabel('Frequentie (Hz)');
%ylabel('Amplitude en Fase');

% Toon de eerste vijf waarden van de impulsresponsie
disp('De eerste vijf waarden van de impulsresponsie:');
disp(h(1:5));
