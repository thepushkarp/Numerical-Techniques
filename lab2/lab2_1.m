docondition()

function docondition()
  for i = 7:12
    A = hilb(i);
    c = cond(A);
    d = det(A)*det(inv(A));
    disp(['Matrix of size ' num2str(i)])
    disp('Condition number of matrix is :')
    disp(c)
    disp('det(A)det(inv(A)) of matrix is :')
    disp(d)
    disp('Discrepancy of A*inv(A) with I is: ')
    disp(abs(d - det(eye(i))))
    fprintf('\n');
  end
end
