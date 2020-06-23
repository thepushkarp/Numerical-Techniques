tiledlayout(3, 1)
nexttile
x = linspace(0, 2*pi, 360);
y = sin(x);
plot(x,y)
grid on;
title('a) y = sin(x)')
nexttile
x = linspace(0, 10, 100);
y = x.^2 - 10*x + 15;
plot(x, y)
grid on;
title('b) y = x^2 - 10x + 15')
nexttile
n = linspace(-2, 2, 5);
h = linspace(1, 5, 5);
scatter(n, h)
grid on;
title('c) n and h(n)')
