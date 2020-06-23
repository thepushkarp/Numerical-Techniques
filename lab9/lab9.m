%% Regression analysis
%% Initialising
clc;
clear;
close all;

x1 = [-3 -2 -1 0 1 2 3];
y1 = [0.2774 0.8958 1.5651 3.4565 3.0601 4.8568 3.8982];

x2 = [0.8 1.4 2.7 3.8 4.8 4.9];
y2 = [0.69 1.00 2.00 2.39 2.34 2.83];

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

[b, y] = linregbuiltin(x1,y1);
plot(x1, y1, 'r*', x1, y, 'b-');
title("Built-in Linear Regression for Question 1");
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

[b, y] = linregbuiltin(x2,y2);
plot(x2, y2, 'r*', x2, y, 'b-');
title("Built-in Linear Regression for Question 2");
xlabel('x');
ylabel('f(x)');
snapnow;
disp ("theta for Question 2 = ");
disp(b);

%% Polynomial Regression

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

%% Built in Linear Regression

function [b, ypred] = linregbuiltin(x,y)
    X = [ones(length(x),1) transpose(x)];
    y = transpose(y);
    b = X\y;
    ypred = (X*b).';
    end
