Eps = [];
Iter = [];
Error = [];
a = -3.4;
b = 1.1;
[ans] = 44736183/400000;

for i = 1:10
    eps = 10^-i;
    n = 1;
    iter = 0;
    I1 = method(a,b,n);
    
    n = n *2  ;
    I2 = method(a,b,n);
    
    while abs(I2-I1)>15*eps
        I1 = I2;
        n = n * 2;
        I2 = method(a,b,n);
        iter = iter + 1;
    end
    Eps = [Eps 10^-i];
    Iter = [Iter iter];
    Error = [Error abs(ans-I2)];
end
figure
loglog(Eps, Error);
hold on
loglog(Eps, Eps);
grid on
legend('error','eps')
title('Зависимость eps от err');

figure
semilogx(Eps, Iter);
hold on
grid on
title('Зависимость iter от eps');
