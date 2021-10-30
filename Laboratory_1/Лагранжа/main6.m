clc
clear
format long


a = 0;
b = 5;

step = 0:0.5:5;
valuefunc = [func(step)];

Mist = [];
N = [];


for n = 1:1:25
    
    N = [N n];
    X = [];
    Y = [];
    a = 0;
    b = 5;
    for i = 0:n
        tk = cos(pi*(2*i+1)/(2*n));
        x = (a+b)/2+(b-a)/2*tk;
        y = func(x);
        X = [X x];
        Y = [Y y];
    end
    summ = 0;
    syms x
    for i = 1:n
        multiply = 1;
        for j = 1:n
            if j~=i
                multiply = multiply * ((x-X(j))/(X(i)-X(j)));
            end   
        end
        summ = summ + Y(i)*multiply;
    end
    L = summ;
    
    
   
    %максимальная ошибка
    valuepol = double(subs(L,x,step));
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
title('Ошибки в полиномах Лагранжа')