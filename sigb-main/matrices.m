% Session 1 - Scalars, vectors & matrices

a = 5;          % scalar, a matrix with 1 row and 1 column

b = [1 2 3];    % vector, a matrix with 1 row and multiple columns

c = [1 2 3; 4 5 6; 7 8 9]; % matrix with 3 rows and 3 columns

%%

x = 1; % rows
y = 2; % columns

zeros(x, y);
ones(x, y);

%%

f = 1:5;        % create a vector with number 1 through 5
g = 1:0.5:5;    % create a vector with numbers 1 through 5 with steps of 0.5

size(g);
