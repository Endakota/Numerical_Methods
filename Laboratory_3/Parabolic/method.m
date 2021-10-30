function int = method(a,b,n)
    h = (b-a)/(2*n);
    k1 = 0;
    k2 = 0;
    for i = 1:2:2*n-1
        k1 = k1 + f(a+h*i);
        k2 = k2 + f(a+(i+1)*h);
    end
    I = f(a) + 4*k1+2*k2-f(b);
    int = I*h/3;
end
% i = 1 3 5 7 ... n
%    1-2 3-4