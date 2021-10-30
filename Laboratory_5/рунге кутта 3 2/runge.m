function [X,Y,h] = runge(a,b,y0,n)
    h = (b-a)/n;
    X=a+(0:n).*h;
    Y(1) = y0;
    for i = 1:n
       k1 = func(X(i),Y(i));
       k2 = func( X(i) + h/2 , Y(i) + h * k1/2);
       k3 = func( X(i) + h , Y(i) - h * k1 + 2 * h * k2);

       Y(i+1) = Y(i) + h/6*(k1 + 4*k2 + k3); 
    end
  
end