%main lab1 function
clc
clear all
alpha = 7;
beta = 3;
i = 2;
beg = i-1;
last = 100;
num = 100;
time1 = zeros(1,last - beg);
time2 = zeros(1,last - beg);
x = beg+1:last;
while i <= last
    j = 1;
    tmp1 = zeros(1,num);
    tmp2 = zeros(1,num);
    while j < num
        A = create(i, alpha, beta);
        b = aSol(i);   
        b = A*b;
        [div, tmp1(j), ch, tmp2(j)] = method(A, b);
        j = j + 1;
    end
    time1(i-beg) = mean(tmp1);
    time2(i-beg) = mean(tmp2);
    i = i+1;
    disp(strcat('progress 1of2. ', num2str(i-1), '/', num2str(last)))
end
subplot(1,2,1);
plot(x, time1, x, time2);
legend('A\x', 'chol');
title('T(n)')

f1 = zeros(1,last - beg);
f2 = zeros(1,last - beg);
condit = zeros(1, last - beg);
i = beg + 1;
minCond = 0;
while i <= last
    j = 1;
    tmp1 = zeros(1,num);
    tmp2 = zeros(1,num);
    tmp3 = zeros(1,num);
    while j < num
        A = create(5, alpha, beta);
        b = aSol(5);
        xt = b;
        b = A*b;
        [div, t1, ch, t2] = method(A, b);
        tmp1(j) = norm(xt - div)/norm(xt);
        tmp2(j) = norm(xt - ch)/norm(xt);
        tmp3(j) = cond(A);
        j = j + 1;
    end
    if i == beg + 1
       minCond = mean(tmp3);
    end
    condit(i-beg) = mean(tmp3);
    f1(i-beg) = mean(tmp1);
    f2(i-beg) = mean(tmp2);
    i = i+1;
    disp(strcat('progress 2of2. ', num2str(i-1), '/', num2str(last)));
    beta = beta + (3.648 - 3)/(last - beg);
end
p = polyfit(condit, f1, 1);
subplot(1,2,2);
plot(condit, f1, condit, f2, condit, polyval(p, condit));
disp(strcat('_______________________'));
syms a b
matrix = sym(create(5, a, b))
p
minCond
maxCond = mean(tmp3)
legend('A\x', 'chol', 'linearisation');
title('F(cond)')

