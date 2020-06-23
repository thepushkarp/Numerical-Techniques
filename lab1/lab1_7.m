A=[3 2 -2; -3 -1 3; 1 2 0];
disp('The matrix A is:')
disp(A)
p = poly(A);
r = roots(p);
disp('Roots of chracterestic equation of matrix A is:')
disp(r)
[V, D] = eig(A);
disp('The eigenvector is:')
disp(V)
disp('The eigenvalues are:')
disp(diag(D))
