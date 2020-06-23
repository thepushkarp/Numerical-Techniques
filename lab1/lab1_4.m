A = [5 6 10; -3 0 14; 0 -7 21];
B = [4 10 0].';
M = [A B];
disp('x using Gauss Jordan elimination is:')
disp(rref(M))
disp('x using A inverse is:')
disp(A\B)
syms x y z;
eqn1 = 5*x + 6*y + 10*z == 4;
eqn2 = -3*x + 14*z == 10;
eqn3 = -7*y + 21*z == 0;
sol = solve([eqn1, eqn2, eqn3], [x, y, z]);
disp('x using solve function is:')
disp([sol.x sol.y sol.z].')
