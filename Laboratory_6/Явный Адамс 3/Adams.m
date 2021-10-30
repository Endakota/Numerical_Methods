function [X,Y,h] = Adams(a,b,y0,n)
    h = (b-a)/(n);
    X=a+(0:(n)).*h;
    Y(1) = y0;
    Y(2) = rungered(X(1),y0,h);
    Y(3) = rungered(X(2),Y(2),h);
    for i = 3:n
        Y(i+1) = Y(i) + h*(23/12*func(X(i),Y(i))-4/3*func(X(i-1),Y(i-1))+5/12*func(X(i-2),Y(i-2))); 
    end
end