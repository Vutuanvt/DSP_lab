clc; clear; clf;

xn = [1/3, 2/3, 1, 1, 1, 1];
xorigin = 3;

// B1: Fold y(n) = x(-n)
yn = xn($:-1:1);
yorigin = length(xn) - xorigin + 1;
n_y = (1:length(yn)) - yorigin;

// B2: Delay 4 z(n) = y(n-4) = x(-n+4)
zn = yn;
zorigin = yorigin - 4;
n_z = (1:length(zn)) - zorigin;

subplot(2,1,1);
plot2d3(n_y, yn, style=2); plot(n_y, yn, "r.");
xtitle("Buoc 1: y(n) = x(-n)", "n", "y(n)"); xgrid();

subplot(2,1,2);
plot2d3(n_z, zn, style=5); plot(n_z, zn, "b.");
xtitle("Buoc 2: z(n) = x(-n + 4)", "n", "z(n)"); xgrid();
