clc 
clear
a = -0.5;
b = 0.5;

step = a:0.1:b;
valuefunc = [func(step)];

p = 1;

for n =4:p:6
    X = [];
    Y = [];
end