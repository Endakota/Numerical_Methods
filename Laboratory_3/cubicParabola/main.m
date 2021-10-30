clear all
a = -2.6;
b = -0.3;
[ans] = 191345303/6000000;

Iter = [];
Eps = [];
Error = [];

for j = 1:8
    eps = 10^(-j);
    n = 1;
    h = (b-a)/(3*n);
    [I1] = cubicParabola(h,n);
    
    n = n * 2;
    h = (b-a)/(3*n);
    [I2] = cubicParabola(h,n);
    while abs(I2-I1)>15*eps
        I1 = I2;
        n = n*2;
        h = (b-a)/(3*n);
        I2 = cubicParabola(h,n);
    end
    Eps = [Eps eps];
    Iter = [Iter log2(n)];
    Error = [Error abs(ans-I2)];
end

figure
loglog(Eps, Error,'linewidth',2);
hold on
loglog(Eps,Eps,'linewidth',2)
grid on
title('Зависимость eps от err');

figure
semilogx(Eps, Iter,'linewidth',2);
hold on
grid on
title('Зависимость eps от iter');
