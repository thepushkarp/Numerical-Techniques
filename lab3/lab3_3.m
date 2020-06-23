% a.
A=[1.01 0.99;0.99 1.01];
b1=[2;2];
x=A\b1

% b.
A=[1.01 0.99;0.99 1.01];
%b1=[2;2];
%x=A\b1
b2=[2.02;1.98];
x2=A\b2

% c.
A=[1.01 0.99;0.99 1.01];
b1=[2;2];
x=A\b1;
b2=[2.02;1.98];
x2=A\b2;
fprintf('Condition number of the given Matrix is');
kappa=cond(A)
fprintf('The upper bound on the possible change in x indicates changes in all of the significant
digits.')
kappa*norm(b1-b2)/norm(b1)
fprintf('The actual change in x resulting from this perturbation is');
norm(x-x2)/norm(x)
fprintf('Relative Error in observation is');
norm(b1-b2)/norm(b1)
