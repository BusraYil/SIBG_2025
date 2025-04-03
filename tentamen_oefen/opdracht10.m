% Gegeven getal
num = 1.35; 

% Aantal bits voor de fractie (Q2.6 heeft 6 bits voor de fractie)
fraction_bits = 6;

% Zet het getal om naar een binaire string met opgegeven fractie-bits
binary_representation = fi(num, 0, 2 + fraction_bits, fraction_bits); 

% Toon de binaire representatie
disp('Binaire representatie in Q2.6:');
disp(binary_representation)
disp(bin(binary_representation))

%%
% Gegeven getal
num = 1.35;

% Aantal bits voor de fractie (Q1.3 heeft 3 bits voor de fractie)
fraction_bits = 3;

% Zet het getal om naar een binaire string met opgegeven fractie-bits
binary_representation = fi(num, 0, 1 + fraction_bits, fraction_bits);

% Toon de binaire representatie
disp('Binaire representatie in Q1.3:');
disp(binary_representation)
disp(bin(binary_representation))