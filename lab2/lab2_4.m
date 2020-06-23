for i = 1:4
  n = [-20 -19 19 20];
  fo = f1(n(i));
  ft = f2(n(i));
  fprintf('f1(%d) is: %25.15e\n', n(i), fo);
  fprintf('f2(%d) is: %25.15e\n', n(i), ft);
  fprintf('Difference is: %25.15e\n\n', abs(fo - ft));
end

disp("Function 2 is better to avoid overflow/underflow")

function f = f1(n)
  x = 36; y = 1e16;
  f = (y.^n)/exp(1).^(n.*x);
end
function f = f2(n)
  x = 36; y = 1e16;
  f = (y/exp(1).^x).^n;
end
