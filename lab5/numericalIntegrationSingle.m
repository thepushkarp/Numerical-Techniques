%% Numerical Integration for LTE
function fval = numericalIntegrationSingle(f, a, b, choice)
    switch choice
        case 1
            fval = trap(f, a, b);
        case 2
            fval = oneThird(f, a, b);
        case 3
            fval = threeEighth(f, a, b);
    end
end

%% Trapezoidal Rule
function fval = trap(f, a, b)
    h = b - a;
    fval = h.*(f(a) + f(a + h))./2;
end

%% Simpson's One Third Rule
function fval = oneThird(f, a, b)
    h = (b - a)./2;
    fval = h.*(f(a) + 4.*f(a + h) + f(a + 2.*h))./3;
end

%% Simpson's Three Eighth Rule
function fval = threeEighth(f, a, b)
    h = (b - a)./3;
    fval = 3.*h.*(f(a) + 3.*f(a + h) + 3.*f(a + 2.*h) + f(a + 3.*h))./8;
end
