disp('Sum of all even integers from 1 to 1000 is:')
addeven(1:1000)
function y = addeven(x)
  evens = x(2:2:end);
  y = sum(evens);
end
