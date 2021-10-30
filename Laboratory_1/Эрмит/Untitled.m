clc
clear
format long

a = 1;
b = 20;
step = a:0.1:b;
valuefunc = [func(step)];

Mist = [];
N = [];
POL = [];
for n = 1:1:25
    
    N = [N n];
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
    ermitpol = 0;
    multi = 1;
    
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
    ERMIT = ermitpol;
    
    valuepol = double(subs(ERMIT,x,step));
    difference = max(abs(valuefunc - valuepol));
    
    Mist = [Mist difference];
    
    valuepol = 0;
    difference = 0;
end
figure
semilogy(N, Mist,'linewidth', 2)
hold on 
grid on
xlabel('Число узлов')
ylabel('Максимальная ошибка')
title('Ошибки в полиномах Эрмита')