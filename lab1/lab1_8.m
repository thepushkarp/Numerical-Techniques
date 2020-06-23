C = -50 + (50 + 50)*rand(1, 10);
disp('The temperatures in C are:')
disp(C.')
F = 9*C/5 +32;
disp('The temperatures in F are:')
disp(F.')
M = [C' F'];
disp('The final matrix is:')
disp(M)
