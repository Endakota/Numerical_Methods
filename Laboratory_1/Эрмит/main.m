clear
clc
step = 1:0.1:20;
p = 2;
a = 1;
b = 20;
valuefunc = [func(step)];
for n = 4:p:8
    X = [];
    Y = [];
    for i = 0:n
        s = a + (b-a)*i/n;
        f = func(s);
        X = [X s];
        Y = [Y f];
    end
    
    syms x;
    
    summ = 0;
    multi = 1;
    ermitpol = 0;
    
    Y_diff = [];
    ff(x) = diff(func(x));
    
    for j = 1:n+1
        Y_diff = [Y_diff double(ff(X(j)))];
        withdiff = (x-X(j)).*Y_diff(j);
        for k = 1:n+1
            if k~=j
                summ = summ + (x-X(j))./(X(j)-X(k));
            end
        end
        for i = 1:n+1
            if i~=j
                multiply = ((x-X(i))./(X(j)-X(i))).^2;
                multi = multi * multiply;
            end
        end
        
        polinom = (withdiff + (1-2.*summ).*Y(j)).*multi;
        ermitpol = ermitpol + polinom; 
        withdiff = 0;
        summ = 0;
        multi = 1;
    end
    if n == 4 
        valuepol1 = double(subs(ermitpol,x,step));
        X1 = X;
        Y1 = Y;
        difference1 = valuefunc - valuepol1;
    end

    if n == 6
        valuepol2 = double(subs(ermitpol,x,step));
        X2 = X;
        Y2 = Y;
        difference2 = valuefunc - valuepol2;
    end

    if n == 8
        valuepol3 = double(subs(ermitpol,x,step));
        X3 = X;
        Y3 = Y;
        difference3 = valuefunc - valuepol3;
    end
end

figure
hold on 
grid on
plot(step, valuefunc, 'k-', step, valuepol1, 'm-', step, valuepol2,'r-', step, valuepol3, 'b', X1, Y1, 'mo', X2, Y2, 'ro', X3, Y3, 'bo')
xlabel('X')
ylabel('Y', 'Rotation', 0)
title('Интерполяционный полином Эрмита')
legend('Функция','Полином (n=3)', 'Полином (n=4)', 'Полином (n=5)', 'Узлы')

figure
hold on 
grid on
plot(step, difference1, 'm-', step, difference2, 'r-', step, difference3, 'b', X1, zeros, 'mo', X2, zeros, 'ro', X3, zeros, 'bo')
xlabel('X')
ylabel('Y', 'Rotation', 0)
title('Ошибки в полиномах Эрмита')
legend('Ошибка полинома (n=3)', 'Ошибка полинома (n=4)', 'Ошибка полинома (n=5)')

