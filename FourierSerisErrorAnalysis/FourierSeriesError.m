clear
clc

format long

syms n x

N = 1
dx = 1e-3
Xmin = -1.1
Xmax = 1.1

c0 = 1/2
c = (2/(pi*(2*n - 1)))^2;
c = inline(c)

s = c0;
for m = 1:N
    s = s + c(m)*cos((2*m - 1)*pi*x);
end

s = simplify(s);
s = inline(s)

x = Xmin:dx:Xmax;

F = zeros(1,length(x));
S = F;
for m = 1:length(x)
    F(1,m) = f(x(m));
    S(1,m) = s(x(m));
end

E = abs(F - S);

disp('max E')
max(E)
disp('at x =')
[r, c] = find(E == max(E));
x(r,c)

disp('min E')
min(E)
disp('at x =')
[r, c] = find(E == min(E));
x(r,c)



plot(x,s(x),x,F,x,E)

