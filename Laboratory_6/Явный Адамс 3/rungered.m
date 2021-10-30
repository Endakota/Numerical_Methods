function [y] = rungered(x0,y0,h)
%     k1 = func(x0,y0);
%     k2 = func( x0 + h/2 , y0 + h*k1/2);
%     k3 = func( x0 + h/2, y0+h*k2/2);
%     k4 = func( x0 + h, y0 + h*k3);
%     y = y0 + h/6*(k1+2*k2+2*k3+k4);
    k1 = func(x0,y0);
    k2 = func( x0 + h/2 , y0 + h * k1/2);
    k3 = func( x0 + h , y0 - h * k1 + 2 * h * k2);

    y = y0 + h/6*(k1 + 4*k2 + k3); 
end
