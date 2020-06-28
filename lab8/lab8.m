%% Interpolation by Newton polynomial

% In interpolation, we ahve to connect some given points in a way that we
% can get reasonable estimate of data points along the given points. The
% curve that we get through interpolation psses through all of the data
% points.

% Newton Polynomial method - For n+1 data points, we can construct a unique
% polynomial of degree n that passes through all of the points

% We get the coefficients of this polynomia from the first row of the
% divided difference table that we calculate here. 

%% Initialising

clear;
close all;
clc;

% Points corresponding to first question
x1 = [-2 -1 1 2 4];
y1 = [-6 0 0 6 60];

% Points corresponding to second question
x2 = [0.8 1.4 2.7 3.8 4.8 4.9];
y2 = [0.69 1.00 2.00 2.39 2.34 2.83];

%% Q1: Newton polynomial of (-2, -6), (-1,0), (1, 0), (2, 6), (4, 60)

%% Calculating the Divided Difference Table and Newton polynomial coefficients

ddTable = divDiff(x1, y1);
coeffs = newtPoly(ddTable, x1);

%% Printing values and plotting

disp('The Divided Difference table is:')
disp(ddTable)
disp('The coefficients of Newton Polynomial are:')
disp(coeffs)

xValues = linspace(-3, 5, 500);
yValues = polyval(coeffs, xValues);

figure(1);

plot(x1, y1, 'r*', xValues, yValues, 'b-')
title('Q1 Interpolation by Newton Polynomial')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q2: Newton polynomial of (0.8, 0.69), (1.4, 1.0), (2.7, 2.0), (3.8, 2.39), (4.8, 2.34), (4.9, 2.83)

%% Calculating the Divided Difference Table and Newton polynomial coefficients

ddTable = divDiff(x2, y2);
coeffs = newtPoly(ddTable, x2);

%% Printing values and plotting

disp('The Divided Difference table is:')
disp(ddTable)
disp('The coefficients of Newton Polynomial are:')
disp(coeffs)

xValues = linspace(0, 5, 500);
yValues = polyval(coeffs, xValues);

figure(2);

plot(x2, y2, 'r*', xValues, yValues, 'b-')
title('Q2 Interpolation by Newton Polynomial')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q3: Exploring in-built interpolation techniques

%% Q1 using interp1

figure(3);

xValues = linspace(-3, 5, 500);
yValues = interp1(x1, y1, xValues);
plot(x1, y1, 'r*', xValues, yValues, 'g-');
title('Q1 Interpolation using inbuilt interpl function')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q2 using interp1

figure(4);

xValues = linspace(0, 5, 500);
yValues = interp1(x2, y2, xValues);
plot(x2, y2, 'r*', xValues, yValues, 'g-');
title('Q2 Interpolation using inbuilt interpl function')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q1 using spline

figure(5);

xValues = linspace(-3, 5, 500);
yValues = spline(x1, y1, xValues);
plot(x1, y1, 'r*', xValues, yValues, 'm-');
title('Q1 Interpolation using inbuilt spline function')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q2 using spline

figure(6);

xValues = linspace(0, 5, 500);
yValues = spline(x2, y2, xValues);
plot(x2, y2, 'r*', xValues, yValues, 'm-');
title('Q2 Interpolation using inbuilt spline function')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Function for Divided Difference table

% This is the algorithm to calculate the divided difference table to
% calculate the coefficients for the Newton polynomial

% It returns a matrix of the divided differences.

function ddTable = divDiff(x, y)
    n = length(x) - 1;
    ddTable = zeros(n + 1, n + 1);
    ddTable(1 : n + 1, 1) = y';
    for i = 2 : n + 1
        for j = 1 : n - i + 2
            ddTable(j, i) = (ddTable(j+1, i-1) - ddTable(j, i-1))/(x(i+j - 1) - x(j));
        end
    end
end

%% Function for coefficients of Newton Polynomial

% Calcultes the coefficients of the Newton Polynomial from the divided
% diffference table

% Returns a vector of coefficients of the polynomil

function coeffs = newtPoly(ddTable, x)
    n = length(x) - 1;
    a = ddTable(1, :);
    coeffs = a(n+1);
    for i = n:-1:1
        coeffs = [coeffs a(i)] - [0 coeffs*x(i)];
    end
end

