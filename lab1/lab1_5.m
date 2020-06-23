A = linspace(1, 30, 30);
pos = sign(sin(A))==1;
disp('All integers between 1 and 30 for which sine is negative are:');
disp(A(pos));
