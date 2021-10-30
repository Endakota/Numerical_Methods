% a = 0.05;
% b = 0.3;
a = 1;
b = 10;
n1 = 2;
n2 = 3;
n3 = 4;

xx=a:0.001:b;

[x1,y1]=cells(n1,a,b);
[x2,y2]=cells(n2,a,b);
[x3,y3]=cells(n3,a,b);

arrEK1=[];
arrEK2=[];
arrEK3=[];
for i=1:n1+1
    errKnot1=(func(xx)-newton(x1,y1,xx)); 
    arrEK1=[arrEK1;errKnot1];
end
for i=1:n2+1
    errKnot2=(func(xx)-newton(x2,y2,xx)); 
    arrEK2=[arrEK2;errKnot2];
end
for i=1:n3+1
    errKnot3=(func(xx)-newton(x3,y3,xx)); 
    arrEK3=[arrEK3;errKnot3];
end
%максимальная ошибка в узлах
maxEK1=max(arrEK1);
maxEK2=max(arrEK2);
maxEK3=max(arrEK3);

arrEM1=[];
arrEM2=[];
arrEM3=[];
for i=2:n1+1
    mid1(i-1) = (x1(i-1)+x1(i))/2;
    errMid1=(func(xx)-newton(mid1,func(mid1),xx)); 
    arrEM1=[arrEM1;errMid1];
end
for i=2:n2+1
    mid2(i-1) = (x2(i-1)+x2(i))/2;
    errMid2=(func(xx)-newton(mid2,func(mid2),xx)); 
    arrEM2=[arrEM2;errMid2];
end
for i=2:n3+1
    mid3(i-1) = (x3(i-1)+x3(i))/2;
    errMid3=(func(xx)-newton(mid3,func(mid3),xx)); 
    arrEM3=[arrEM3;errMid3];
end
%максимальная ошибка в серединах узлов
maxEM1=max(arrEM1);
maxEM2=max(arrEM2);
maxEM3=max(arrEM3);

figure
hold on
grid on
plot(xx,func(xx),'black','DisplayName','f')
plot(xx,newton(x1,y1,xx),'r','DisplayName','3')
plot(xx,newton(x2,y2,xx),'g','DisplayName','4')
plot(xx,newton(x3,y3,xx),'b','DisplayName','5')
plot(x1,y1,'or')
plot(x2,y2,'og')
plot(x3,y3,'ob')
legend
title("Графики функций 3-х полиномов")

figure
grid on
h1 = plot(xx,arrEK1,'red','DisplayName','3')
hold on
h2 = plot(xx,arrEK2,'green','DisplayName','4')
h3 = plot(xx,arrEK3,'blue','DisplayName','5')
legend([h1(1),h2(1),h3(1)], '3', '4', '5')
title("Графики ошибки в узлах")

figure
hold on
grid on
h1 = plot(xx,arrEM1,'r')
hold on
h2 = plot(xx,arrEM2,'g')
h3 = plot(xx,arrEM3,'b')
legend([h1(1),h2(1),h3(1)],'3','4','5')
title("Графики ошибки в серединах узлов")