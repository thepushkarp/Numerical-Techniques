% Matlab script to calculate numerical differentiation of arctan(x)
clc;
clear;
close all;
a = 1;
truVal = 1/(1 + a.^2);
h = 1e-4;
% Forward difference formula
fwdDiff = (f(a + h) - f(a))/h;
errFwd = abs(truVal - fwdDiff);
disp(['Error in forward difference: ', num2str(errFwd)]);
% Backward difference formula
bckDiff = (f(a) - f(a - h))/h;
errBck = abs(truVal - bckDiff);
disp(['Error in backward difference: ', num2str(errBck)]);
% Central difference formula
cntrDiff = (f(a + h) - f(a - h))/(2*h);
errCntr = abs(truVal - cntrDiff);
disp(['Error in central difference: ', num2str(errCntr)]);
% Improved Forward difference formula
iFwdDiff = (-f(a + 2*h) + 4*f(a + h) -3*f(a))/(2*h);
errIFwd = abs(truVal - iFwdDiff);
disp(['Error in improved forward difference: ', num2str(errIFwd)]);
% Improved Backward difference formula
iBckDiff = (3*f(a) - 4*f(a - h) + f(a - 2*h))/(2*h);
errIBck = abs(truVal - iBckDiff);
disp(['Error in improved backward difference: ', num2str(errIBck)]);
% Improved Central difference formula
iCntrDiff = (8*f(a + h) - 8*f(a - h) - f(a + 2*h) + f(a - 2*h))/
(12*h);
errICntr = abs(truVal - iCntrDiff);
disp(['Error in improved central difference: ', num2str(errICntr)]);
% PLoting graph for diffrent method
semilogy([errFwd, errBck, errCntr, errIFwd, errIBck, errICntr], 'o')
title('Error for the step size h = 1e # 04')
ylabel('Error')
xlabel('Different error methods')
% Defining function for tan inverse(x)
function fx = f(x)
  fx = atan(x);
end


% Matlab script to calculate numerical differentiation of arctan(x)
clc;
clear;
close all;
a = 1;
truVal = 1/(1 + a.^2);
h = 10.^[-1:-1:-8];
% Forward difference formula
fwdDiff = (f(a + h) - f(a))./h;
errFwd = abs(truVal - fwdDiff);
disp(['Error in forward difference: ', num2str(errFwd)]);
% Backward difference formula
bckDiff = (f(a) - f(a - h))./h;
errBck = abs(truVal - bckDiff);
disp(['Error in backward difference: ', num2str(errBck)]);
% Central difference formula
cntrDiff = (f(a + h) - f(a - h))./(2.*h);
errCntr = abs(truVal - cntrDiff);
disp(['Error in central difference: ', num2str(errCntr)]);
% Improved Forward difference formula
iFwdDiff = (-f(a + 2*h) + 4*f(a + h) - 3*f(a))./(2.*h);
errIFwd = abs(truVal - iFwdDiff);
disp(['Error in improved forward difference: ', num2str(errIFwd)]);
% Improved Backward difference formula
iBckDiff = (3*f(a) - 4*f(a - h) + f(a - 2*h))./(2.*h);
errIBck = abs(truVal - iBckDiff);
disp(['Error in improved backward difference: ', num2str(errIBck)]);
% Improved Central difference formula
iCntrDiff = (-f(a + 2*h) + 8*f(a + h) - 8*f(a - h) + f(a - 2*h))./(12.*h);
errICntr = abs(truVal - iCntrDiff);
disp(['Error in improved central difference: ', num2str(errICntr)]);
% Plots
loglog(h, errFwd, '-b', h, errBck, '-g', h, errCntr, '-m');
hold on;
loglog(h, errIFwd, '--b', h, errIBck, '--g', h, errICntr, '--m');
legend('Forward Error', 'Backward Error', 'Central Error', 'Improved
Forward Error', 'Improved Backward Error', 'Improved Central
Error', 'Location', 'northwest');
% Function
function fx = f(x)
  fx = atan(x);
end

%Truncation Error is caused by a truncated Taylor series expansion replacing the spatial derivative and time derivative. The order of truncation error is proportional to #x (grid size) and #t (step size). This implies that as #x and #t decreases, the truncation error decreases. However, decreased grid size and timestep size result in an increased number of computational operations, which introduces additional error called computational round-off error. Therefore, the trade-off between truncation error and round-off error should be examined carefully.
