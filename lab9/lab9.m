%% Regression analysis

% Linear Regression - Obtain a straight line that best fits the data

% Least Squares method for Linear Regression - Suppose a line that fits the
% data has an equation f(x) = a1*x + a0. This generate a point (x, p) for
% every corresponding x in our data. This p is the predicted value of the
% data and it differes from the actual value y by |y - p|. The least
% squares method gives us a line which minimises the sum of squares of all
% the errors over all points in our data to give a line that best fits our
% data.

% Polynomial regresison - Obtain a curve of a given degree 'n' that best
% fits the data.

% NOTE: There's a builtin method called lsqcurvefit that plots the best-fit
% curve of a given degree but I haven't used it here. Read about it from
% the docs.


%% Initialising
clc;
clear;
close all;

% Points corresponding to the first question
x1 = [-3 -2 -1 0 1 2 3];
y1 = [0.2774 0.8958 1.5651 3.4565 3.0601 4.8568 3.8982];

% Points corresponding to the second question
x2 = [0.8 1.4 2.7 3.8 4.8 4.9];
y2 = [0.69 1.00 2.00 2.39 2.34 2.83];

% Degrees for polynomial regression
poly_features = [1 3 5 7];
len = length(poly_features);

%% Question 1

figure(1);

for i = 1:len

    t = polyreg(x1, y1, poly_features(i));
    xValues = linspace(-3, 3, 500);
    yValues = polyval(t, xValues);
    subplot(2, 2, i)
    plot(x1, y1, 'r*', xValues, yValues, 'b-');
    title("Polynomial curve of degree = " + poly_features(i));
    xlabel('x');
    ylabel('f(x)');

end

sgtitle('Polynomial Regression for Question 1');
snapnow;

figure(2);

[b, y] = linreg(x1,y1);
plot(x1, y1, 'r*', x1, y, 'b-');
title("Linear Regression for Question 1");
xlabel('x');
ylabel('f(x)');
snapnow;
disp ("theta for Question 1 = ");
disp(b);

figure(3);

[b, y] = linregpolyapp(x1,y1);
plot(x1, y1, 'r*', x1, y, 'b-');
title("Linear Regression with poly. approx. for Question 1");
xlabel('x');
ylabel('f(x)');
snapnow;
disp ("theta for Question 1 = ");
disp(b);

%% Question 2

figure(4);

for i = 1:len

    t = polyreg(x2, y2, poly_features(i));
    xValues = linspace(0, 6, 500);
    yValues = polyval(t, xValues);
    subplot(2, 2, i)
    plot(x2, y2, 'r*', xValues, yValues, 'b-');
    title("Polynomial curve of degree = " + poly_features(i));
    xlabel('x');
    ylabel('f(x)');

end

sgtitle('Polynomial Regression for Question 2');
snapnow;

figure(5);

[b, y] = linreg(x2,y2);
plot(x2, y2, 'r*', x2, y, 'b-');
title("Linear Regression for Question 2");
xlabel('x');
ylabel('f(x)');
snapnow;
disp ("theta for Question 2 = ");
disp(b);

figure(6);

[b, y] = linregpolyapp(x2,y2);
plot(x2, y2, 'r*', x2, y, 'b-');
title("Linear Regression with poly. approx. for Question 2");
xlabel('x');
ylabel('f(x)');
snapnow;
disp ("theta for Question 2 = ");
disp(b);

%% Polynomial Regression

% This is a n-degree polynomial approximation to get the best-fitting curve
% of n degrees.

% It returns values of a0, a1, ... , an, a(n+1) from the equation
% y = a0 + a1*x + a2*x^2 ... a(n+1)*x^n

function ypred = polyreg(x,y, feature)

    n = length(x);
    A = [x.' ones(n,1)];
    Y = y.';
    for i = 2:feature
        A = [A(:, 1).*(x.') A];
    end
    ypred = (inv((A.')*A)*(A.'))*Y;
end

%% Linear Regression

% This is Linear Regression algorithm using Least Square Approximation.

% It returns the values of y, a0 and a1 from the equation y = a1*x + a0.

function [b, ypred] = linreg(x,y)

    y = transpose(y);

    sumX = 0;
    sumX2 = 0;
    sumY = 0;
    sumXY = 0;

    for i = 1:length(x)

        sumX = sumX + x(i);
        sumX2 = sumX2 + x(i)*x(i);
        sumY = sumY + y(i);
        sumXY = sumXY + x(i)*y(i);

    end

    b = (length(x)*sumXY - sumX*sumY)/(length(x)*sumX2 - sumX*sumX);
    a = (sumY - b*sumX)/length(x);

    ypred = a + b*x;
    b = [a; b];

end

%% Linear Regression using Polynomical Approximation of first degree

% This is a straightforward first degree polynomial approximation to get
% the best-fit straight line.

% It returns the values of y, a0 and a1 from the equation y = a1*x + a0.

% This is same as LS method for Linear Regression.

function [b, ypred] = linregpolyapp(x,y)
    X = [ones(length(x),1) transpose(x)];
    y = transpose(y);
    b = X\y;
    ypred = (X*b).';
    end
