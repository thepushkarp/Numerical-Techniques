%% Question 1 - LTE
%% Numerical integration of 2 - x + ln(x)
% a = 1 and b = 2

clc;
clear;
close all;

%% True Value of the integration of the function from b to a
a = 1;
b = 2;
truVal = integratedf(b) - integratedf(a);

%% Calculating the error using Trapezoid Rule

trap = numericalIntegrationSingle(@f, a, b, 1);

errTrap = abs(trap - truVal);

%% Calculating the error using Simpson's One Third Rule 

oneThird = numericalIntegrationSingle(@f, a, b, 2);

errOneThird = abs(oneThird - truVal);

%% Calculating the error using Simpson's Three Eighth Rule 

threeEighth = numericalIntegrationSingle(@f, a, b, 3);

errThreeEighth = abs(threeEighth - truVal);

%% Displaying the errors

disp(['The error using Trapezoidal Rule is : ', num2str(errTrap)]);
disp(['The error using Simpson''s One Third Rule is : ', num2str(errOneThird)])
disp(['The error using Simpson''s Three Eighth Rule is : ', num2str(errThreeEighth)])

%% Plots

semilogy(1, errTrap,'ro', 2, errOneThird, 'go', 3, errThreeEighth, 'bo')
legend('Trapezoidal Rule', 'Simpson''s One Third Rule', 'Simpson''s Three Eighth Rule')
title('LTE for numerical integration of 2 - x + ln(x)')
xlabel('Methods of Numerical Integration')
ylabel('Error')

%% Function that is to be integrated
function fval = f(x)
    fval = 2 - x + log(x);
end

%% Integrated Function
function fx = integratedf(x)
    fx = 2.*x - (x.^2)./2 + x.*log(x) - x;
end
