a = 1;
b = 10;
xx = a:0.01:b;
Err = [];
N = [];

for n=2:60
    [x,y]=cells(n,a,b);
    err = max(abs(func(xx)-newton(x,y,xx)));
    Err = [Err, err];
    N = [N,n+1];
end

figure
semilogy(N,Err)
hold on
grid on

