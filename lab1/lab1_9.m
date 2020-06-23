C = -50 + (50 + 50)*rand(1, 10);
disp('The temperatures in C are:')
disp(C);
F = c2f(C);
disp('The temperatures in F are:')
disp(F)
function f = c2f(c)
  f = 9*c/9 + 32;
end
