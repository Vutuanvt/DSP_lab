clc; clear; clf;

xn = [1/3, 2/3, 1, 1, 1, 1];
xorigin = 3;

// B1: Delay y(n) = x(n-4)
yn = xn;
yorigin = xorigin - 4;
n_y = (1:length(yn)) - yorigin;

// B2: Fold z(n) = y(-n) = x(-n-4)
zn = yn($:-1:1);
zorigin = length(yn) - yorigin + 1;
n_z = (1:length(zn)) - zorigin;

subplot(2,1,1);
plot2d3(n_y, yn, style=2); plot(n_y, yn, "r.");
xtitle("Buoc 1: y(n) = x(n - 4)", "n", "y(n)"); xgrid();

subplot(2,1,2);
plot2d3(n_z, zn, style=5); plot(n_z, zn, "b.");
xtitle("Buoc 2: z(n) = x(-n - 4)", "n", "z(n)"); xgrid();
