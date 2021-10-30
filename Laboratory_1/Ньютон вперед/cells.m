function [x,y] = cells(n,a,b)
    x = [];
    y = [];
    h= (b-a)/n;
    for k = 0:n
        xk= a+ h*k;
        x=[x,xk];
    end
%     x = sort(x);
    for k = 0:(n)
        yk=func(x(k+1));
        y=[y,yk];
    end
end