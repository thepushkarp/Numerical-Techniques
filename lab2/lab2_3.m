x = linspace(10.^14, 10.^16, 100);
fun1 = f1(x);
fun2 = f2(x);
plot(linspace(1, 100, 100), fun1 - fun2, 'color','red')
grid on

function f = f1(x)
  f = sqrt(2*(x.^2) + 1) - 1;
end

function f = f2(x)
  f = (2.*x.^2)./(sqrt(2.*x.^2) + 1) - 1;
end
