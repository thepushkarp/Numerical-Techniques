threeheads = 0;
for i = 1:1000
  number = 0;
  for j = 1:4
    if rand(1,1) < 0.75
      x = 1;
    else
      x = 0;
    end
    number = number + x;
  end
  if number == 3
    threeheads = threeheads + 1;
  end
end
disp(['The probability of 3 heads in 4 coin tosses is: '
num2str(threeheads/1000)]);
