n = 25;
disp(['The factorial of ' num2str(n) ' is: ' num2str(fact(n))])
function f = fact(n)
  f = prod(1:n);
end
