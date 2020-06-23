A=[1.01 0.99;0.99 1.01];
b1=[2;2]; % observation vector b1
x=A\b1;
b2=[2.02;1.98]; % observation vector b2
x2=A\b2;
fprintf('Backward error is');
norm(b1-b2) % Backward error
