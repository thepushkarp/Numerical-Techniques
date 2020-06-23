% a.
prompt = 'Write the value of x';
x = input(prompt);
result=1/(1+x*x) %derivative of atan(x)

% b.
a=1;
trueval=1/(1+a*a); %derivative of atan(a)
Error=[];%creation of Error array
for i=1:16 %loop for executive error of different stepsizes
  h=10^-i;
  expval=(atan(a+h)-atan(a))/h;
  Error(i)=abs(trueval-expval);%creates an array of 1X16 values of array at different valyes of stepsizes
end
n=[-1:-1:-16];
h=10.^n;%array of 16 different values of h
loglog(h,Error) %grapg betweeen values of h and Error
xlabel('Values of h');
ylabel('Error');
