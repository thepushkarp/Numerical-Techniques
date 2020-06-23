% Matlab script to calculate first order numerical differentiation of 2 # x + ln(x) at x = 1
clc;
clear;
close all;
a = 1;
truVal = 0;
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
% Plots
semilogy([errFwd, errBck, errCntr, errIFwd, errIBck, errICntr], '*')
title('Error for the step size h = 1e # 04')
ylabel('Error')
xlabel('Different error methods')
% Function
function fx = f(x)
  fx = 2 - x + log(x);
end

% Matlab script to calculate first order numerical differentiation of 2 # x + ln(x) at x = 1
clc;
clear;
close all;
a = 1;
truVal = 0;
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
legend('Forward Error', 'Backward Error', 'Central Error', 'Improved Forward Error', 'Improved Backward Error', 'Improved Central Error', 'Location', 'northwest');
hold on;
% Function for 2 # x + ln(x)
function fx = f(x)
  fx = 2 - x + log(x);
end

% Matlab script to calculate second order numerical differentiation of 2 # x + ln(x) at x = 1
clc;
clear;
close all;
a = 1;
truVal = -1;
h = 10.^[-1:-1:-8];
% Forward difference formula for second order derivative
fwdDiff = (f(a + 2*h) - 2*f(a + h) + f(a))./(h.*h);
errFwd = abs(truVal - fwdDiff);
disp(['Error in forward difference for second order derivative: ',
num2str(errFwd)]);
% Backward difference formula for second order derivative
bckDiff = (f(a) - 2*f(a - h) + f(a - 2*h))./(h.*h);
errBck = abs(truVal - bckDiff);
disp(['Error in backward difference for second order derivative: ',
num2str(errBck)]);
% Central difference formula for second order derivative
cntrDiff = (f(a + h) - 2*f(a) + f(a - h))./(h.*h);
errCntr = abs(truVal - cntrDiff);
disp(['Error in central difference for second order derivative: ',
num2str(errCntr)]);
% Plots
loglog(h, errFwd, '-b', h, errBck, '-g', h, errCntr, '-m');
legend('Forward Error', 'Backward Error', 'Central Error', 'Location', 'northwest');
% Function
function fx = f(x)
  fx = 2 - x + log(x);
end

% Matlab script to calculate first order numerical differentiation of 2 # x + ln(x) at x = 1
clc;
clear;
close all;
a = 1;
truVal = -1;
h = 1e-4;
% Forward difference formula for second order derivative
fwdDiff = (f(a + 2*h) - 2*f(a + h) + f(a))./(h.*h);
errFwd = abs(truVal - fwdDiff);
disp(['Error in forward difference for second order derivative: ', num2str(errFwd)]);
% Backward difference formula for second order derivative
bckDiff = (f(a) - 2*f(a - h) + f(a - 2*h))./(h.*h);
errBck = abs(truVal - bckDiff);
disp(['Error in backward difference for second order derivative: ', num2str(errBck)]);
% Central difference formula for second order derivative
cntrDiff = (f(a + h) - 2*f(a) + f(a - h))./(h.*h);
errCntr = abs(truVal - cntrDiff);
disp(['Error in central difference for second order derivative: ', num2str(errCntr)]);
% Plots
semilogy([errFwd, errBck, errCntr], 'o')
title('Error for the step size h = 1e # 04')
ylabel('Error')
xlabel('Different error methods')
% Function
function fx = f(x)
  fx = 2 - x + log(x);
end
