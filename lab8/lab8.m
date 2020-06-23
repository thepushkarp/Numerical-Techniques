%% Interpolation by Newton polynomial

%% Initialising

clear;
close all;
clc;

x1 = [-2 -1 1 2 4];
y1 = [-6 0 0 6 60];

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

plot(x1, y1, 'r*', xValues, yValues, 'b-')
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

plot(x2, y2, 'r*', xValues, yValues, 'b-')
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q3: Exploring in-built interpolation techniques

%% Q1 using interp1
xValues = linspace(-3, 5, 500);
yValues = interp1(x1, y1, xValues);
plot(x1, y1, 'r*', xValues, yValues, 'g-');
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q2 using interp1
xValues = linspace(0, 5, 500);
yValues = interp1(x2, y2, xValues);
plot(x2, y2, 'r*', xValues, yValues, 'g-');
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q1 using spline
xValues = linspace(-3, 5, 500);
yValues = spline(x1, y1, xValues);
plot(x1, y1, 'r*', xValues, yValues, 'm-');
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Q2 using spline
xValues = linspace(0, 5, 500);
yValues = spline(x2, y2, xValues);
plot(x2, y2, 'r*', xValues, yValues, 'm-');
legend('Given data points', 'Interpolated polynomial', 'Location', 'northwest')
xlabel('x')
ylabel('f(x)')

%% Function for Divided Difference table

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

function coeffs = newtPoly(ddTable, x)
    n = length(x) - 1;
    a = ddTable(1, :);
    coeffs = a(n+1);
    for i = n:-1:1
        coeffs = [coeffs a(i)] - [0 coeffs*x(i)];
    end
end

