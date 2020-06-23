% Matlab script to calculate partial derivative of f(x) =
sin(x1)exp(#x2)
clc;
clear;
close all;
a = [0.5; 1];
h = [10e-6; 10e-6];
truVal = [cos(a(1))*exp(-a(2)); -sin(a(1))*exp(-a(2))];
% Central difference formula
% Partial differentiation w.r.t x
cntDiff(1) = (f(a(1) + h(1), a(2)) - f(a(1) - h(1), a(2)))./(2.*h(1));
% Partial differentiation w.r.t y
cntDiff(2) = (f(a(1), a(2) + h(2)) - f(a(1), a(2) - h(2)))./(2.*h(2));
errCnt = abs(truVal - cntDiff.');
disp('Error in cntDiff is:');
disp(errCnt)
% The errCnt has two values: The first one is the differentiation
w.r.t x
% and second is differentiation w.r.t y.
% Plot
semilogy(errCnt, 'r*')
% Function
function fx = f(x1, x2)
  fx = sin(x1)*exp(-x2);
end
