% a.
a = 0.1;
trueval=exp(a);
expval = 1;
currentterm = 1;
prompt = 'Enter the value of n';
n = input(prompt);
for i = 1 : n %loop to calculate the expected value of exp(a)
  currentterm = currentterm*(a/i); % ith term of the exp is a^i/i!=a*a^(i-1)/i*(i-1)=(a/i)*cur-rentterm
  expval(i+1)=expval(i)+currentterm;
end
Error=abs(trueval-expval(n+1)); % error in calculating = trueval-expval
fprintf('Error in calculating e^0.1 for n=%d is %1.20f',n,Error);

% b.
a = 0.1;
trueval=exp(a);
expval = 1;
currentterm = 1;
for i = 1 : 5 %loop to calculate the expected value of exp(a)
  currentterm = currentterm*(a/i); % ith term of the exp is a^i/i!=a*a^(i-1)/i*(i-1)=(a/i)*cur-rentterm
  expval(i+1)=expval(i)+currentterm;
end
Error=abs(trueval-expval); % error in calculating = trueval-expval
n=[0:1:5];
plot(n,Error)

% c.
aAll=[0.1 0.05 0.02 0.01]; %array of all the step sizes
vec=[1:5]; %array of all the values of n
Error=[];
for i=1:length(aAll) %loop for calculating error of all the step sizes
  a=aAll(i); %selecting of individual step sizes as a
  terms=a.^vec./cumprod(vec); %makes as array of the value of nth term
  expval=1+cumsum(terms); %makes an array of expexted value at each value of n
  trueval=exp(a);
  Error=[Error;abs(trueval-expval)]; %this makes an matrix of size 4X5 where each column tells the
  error associaled with that stepsize
end
loglog(aAll,Error);
xlabel('log10(n)');
ylabel('log10(Error)');
legend('n1','n2','n3','n4','n5');
