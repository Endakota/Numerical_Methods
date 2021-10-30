n = 1
h = (b-a)/(3*n)
a = -2.6;
    b = -0.3;
X = []


[I1] = cubicParabola(h,n)

n = 2
h2 = (b-a)/(3*n)
[I2] = cubicParabola(h2,n)


n = 4
h3 = (b-a)/(3*n)
[I3] = cubicParabola(h3,n)
for i = 1:3*n-1
    
    x = a+i*h3;
    X = [X x]
end
[ans] = 191345303/6000000