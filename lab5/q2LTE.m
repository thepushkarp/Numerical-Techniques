%% Question 2 - LTE
%% Numerical integration of x^3 - 2x,
% a = 0 and b = pi/2

clc;
clear;
close all;

%% True Value of the integration of the function from b to a
a = 0;
b = pi./2;
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
title('LTE for numerical integration of x^3 - 2x')
xlabel('Methods of Numerical Integration')
ylabel('Error')

%% Function that is to be integrated
function fval = f(x)
    fval = x.^3 - 2.*x;
end

%% Integrated Function
function fx = integratedf(x)
    fx = (x.^4)./4 - x.^2;
end
