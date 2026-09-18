clc;
clear;
clf;

// Tao tin hieu x(n)
n = -1:1;
x = [1 3 -2];

// Tao x(-n) bang cach dao nguoc x(n)
x_reverse = [x(3) x(2) x(1)];

// Tinh thanh phan chan
xe = (x + x_reverse) / 2;

// Tinh thanh phan le
xo = (x - x_reverse) / 2;

// Ve tin hieu x(n)
subplot(3,1,1);
plot2d3(n, x);
plot(n, x, "r.");
xgrid();
title("Tin hieu x(n)");
xlabel("Chi so n");
ylabel("Bien do");

// Ve thanh phan chan
subplot(3,1,2);
plot2d3(n, xe);
plot(n, xe, "r.");
xgrid();
title("Thanh phan chan x_e(n)");
xlabel("Chi so n");
ylabel("Bien do");

// Ve thanh phan le
subplot(3,1,3);
plot2d3(n, xo);
plot(n, xo, "r.");
xgrid();
title("Thanh phan le x_o(n)");
xlabel("Chi so n");
ylabel("Bien do");
