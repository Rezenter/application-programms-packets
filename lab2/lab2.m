%main lab2 function
clc
clear all
alpha = 7;
beta = 3;
syms a b;
v = sym(create(5, a, b))

syms R E
tmp(1,1) = R;
tmp(2,2) = -E;
matrix = sym(tmp)

tmp(1,1) = 'lambda';
tmp(2,2) = 'lambda';
R = sym(tmp)

E = sym(eye(2))

tmp(1:2,1:2) = R;
tmp(3:4,3:4) = -E;
matrix = sym(tmp)
y := (x+2)/(x^3+5*x+2);
%A := (V*matrix)