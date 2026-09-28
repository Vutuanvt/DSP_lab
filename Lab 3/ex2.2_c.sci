clc; clear; clf;

xn = [1/3, 2/3, 1, 1, 1, 1];
xorigin = 3;

// truc tiep x(-n+4) = Fold x(n) roi Delay 4
zn = xn($:-1:1);
zorigin = (length(xn) - xorigin + 1) - 4; // zorigin = 0
n_z = (1:length(zn)) - zorigin;

plot2d3(n_z, zn, style=3);
plot(n_z, zn, "k.");
xtitle("Tin hieu x(-n + 4)", "n", "x(-n + 4)");
xgrid();
