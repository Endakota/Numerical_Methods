a = 0;
b = 1;
y0 = tochnY(a);
%
n1 = 10;
[X1,Y1] = finiteDiff(a,b,y0,n1);
%
n2 = 5;
[X2,Y2] = finiteDiff(a,b,y0,n2);
%������ �������
xx =a:0.1:b;
TY1 =[];
for i=1:length(xx)
    TY1(i) = tochnY(xx(i));
end

arrOsh1 = [];
arrOsh2 = [];
for i = 1:n1+1
    osh1 = abs(tochnY(X1(i))-Y1(i));
    arrOsh1 = [arrOsh1,osh1];
end
for i = 1:n2+1
    osh2 = abs(tochnY(X2(i))-Y2(i));
    arrOsh2 = [arrOsh2,osh2];
end

FT3 = [];
TY3 =[];
H = [];              
for n = 10:10:10000
    [X3,Y3,h] = finiteDiff(a,b,y0,n);
    for i=1:length(X3)
        TY3(i) = tochnY(X3(i));
    end
    factT3 = norm(TY3-Y3,inf);
    FT3 = [FT3, factT3];
    H = [H, h];
end

n4=1000;
delta=10^(-14);
arrD=[]; 
FT4=[];
while delta<0.01
    y0=y0+delta;
    delta=delta*5;
    [X4,Y4] = finiteDiff(a,b,y0,n4);
    for i=1:length(X4)
        TY4(i) = tochnY(X4(i));
    end
    arrD=[arrD, delta];
    FT4=[FT4, norm(TY4-Y4, inf)] ;
end

figure
hold on
grid on
plot(xx,TY1,'r')
plot(X1,Y1,'g')
plot(X2,Y2,'b')
legend('������ �������','��� h=0.1','��� h=0.2')
title('������� ������� � ���������� ������� �� �������')

figure
hold on
grid on
plot(X1,arrOsh1)
plot(X2,arrOsh2)
legend('��� h=0.1','��� h=0.2')
title('������� ������ �� �������� �������')

%
figure
loglog(H, FT3, 'g', H, H.^2, 'r')
hold on
grid on
legend('����������� ��������', 'h^2')
title('������ ����������� ����������� �������� �� �������� ����')

figure
loglog(arrD,FT4)
hold on 
grid on
legend('������������� ��� h = 0,001')
title('������ ����������� ����� ������ �� �������� ����������')