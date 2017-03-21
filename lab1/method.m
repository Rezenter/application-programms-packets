%method(A, b), A = matrix, b = vector, method(A, b) = [A\b , t1, cholSolution, t2]
function [div, t1, ch, t2] = method(A, b)
tic;
div = A\b;
t1 = toc;
tic;
r = chol(A, 'lower');
y = zeros(1, length(b));
for i = 1:length(b)
    if i == 1
       y(i) = b(1)/r(1,1);
    else
        y(i) = (b(i) - r(i, i - 1)*y(i - 1))/r(i,i);
    end
end
x = zeros(1, length(b));
r = r';
for i = length(b):-1:1
    if i == length(b)
       x(i) = y(i)/r(i,i);
    else
        x(i) = (y(i) - r(i, i + 1)*x(i + 1))/r(i,i);
    end
end
ch = x';
t2 = toc;
end