clear;
clc;

p = 2;
step = 0:0.01:5;
valuefunc = [func(step)];
for n = 4:p:8
    
    X = [];
    Y = [];
    a = 0;
    b = 5;
    for i = 0:n
        x = a + (b-a)*i/n;
        y = func(x);
        X = [X x];
        Y = [Y y];
    end
    
    summ = 0;
    syms x
    for i = 1:n+1
        multiply = 1;
        for j = 1:n+1
            if j~=i
                multiply = multiply * ((x-X(j))/(X(i)-X(j)));
            end   
        end
        summ = summ + Y(i)*multiply;
    end
    L = summ;
    if n==4
        valuepol1 = double(subs(L,x,step));
        X1 = X;
        Y1 = Y;
        diff1 = valuefunc-valuepol1;
    end
    if n==6
        valuepol2 = double(subs(L,x,step));
        X2 = X;
        Y2 = Y;
        diff2 = valuefunc-valuepol2;
    end
    if n==8
        valuepol3 = double(subs(L,x,step));
        X3 = X;
        Y3 = Y;
        diff3 = valuefunc-valuepol3;
    end
end
figure
hold on 
grid on
plot(step, valuefunc, 'k-', step, valuepol1, 'm-', step, valuepol2,'r-', step, valuepol3, 'b', X1, Y1, 'mo', X2, Y2, 'ro', X3, Y3, 'bo')
xlabel('X')
ylabel('Y', 'Rotation', 0)

figure
hold on 
grid on
plot(step, diff1, 'm-', step, diff2, 'r-', step, diff3, 'b', X1, zeros, 'mo', X2, zeros, 'ro', X3, zeros, 'bo')

xlabel('X')
ylabel('Y', 'Rotation', 0)
title('������ � ��������� �������� c �������� � ����� 0.15')
legend('������ �������� (n=3)', '������ �������� (n=4)', '������ �������� (n=5)')
