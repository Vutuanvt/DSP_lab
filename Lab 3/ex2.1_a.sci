clc; clear; clf;

xn = [1/3, 2/3, 1, 1, 1, 1];
xorigin = 3;
n_x = (1:length(xn)) - xorigin;

// Ve do thi x(n)
plot2d3(n_x, xn, style=2);
plot(n_x, xn, "r.");
xtitle("Tin hieu goc x(n)", "n", "x(n)");
xgrid();
