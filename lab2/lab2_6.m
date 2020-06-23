x = 9.8^-201;
y = 10.2^-199;
z = sqrt(x^2+y^2)/y; %equation1
fprintf("z = %20.18f \n",z);
w = sqrt((x/y)^2+1); %equation2
fprintf("w = %20.18f \n",w);
disp("equation 2 is better in terms of the power of resisting the
underflow.")
