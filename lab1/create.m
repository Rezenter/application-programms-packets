%create function, builds test matrix; args = (n = dim, alpha = paramA , beta = paramB)
function res = create(n, alpha, beta)
res = eye(n)*alpha + diag(beta*ones(1,n - 1), 1) + diag(beta*ones(1,n - 1), -1);
res(1,1) = alpha - beta;
end
