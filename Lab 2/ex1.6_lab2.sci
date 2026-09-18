clc;
clear;
clf;

// Thong so
F0 = 50;
Fs = 200;

Tp = 1/F0;
T = 1/Fs;

// Chu ky cua tin hieu roi rac
N = Tp/T;

disp(N, "Chu ky co ban N = ");

// Tao tin hieu roi rac
n = 0:15;
x = sin(2*%pi*F0*n*T);

// Ve tin hieu
plot2d3(n, x);
plot(n, x, "r.");
xgrid();

title("Tin hieu roi rac x(n) - Chu ky N = 4");
xlabel("Chi so n");
ylabel("Bien do");
