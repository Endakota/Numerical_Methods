function [I] = cubicParabola(h,n)
    a = -2.6;
    b = -0.3;
    I = f(a)+f(b);
    for i = 1:3*n-1
        x = a+h*i;
        if mod(i,3) == 0
            I = I + 2*f(x);
        else
            I = I + 3*f(x);
        end
    end
    I  = 3/8*I*h;
end