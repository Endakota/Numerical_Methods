function d = divDif(n,Y)
    summ = 0;
    multiply = 1;
    for j = 1:n+1
        for k = 1:n+1
            if k~=j
                multiply = multiply * (X(j)-X(k));
            end
        end
        summ = summ + Y(j)/multiply;
    end
    d = summ;
end