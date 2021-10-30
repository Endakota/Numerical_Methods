function [X,Y,h] = ElerKoshi(a,b,y0,n)
    h = (b-a)/n;
    X=a+(0:n).*h;
    Y(1)=y0;
    for i = 1:n
        Y(i+1) = Y(i)+ h*func(X(i),Y(i));
    end
end
