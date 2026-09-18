clc; clear; clf;

// 1. Tin hieu tuong tu xa(t) trong 5 chu ky (0 den 0.1 s)
subplot(3, 1, 1);
t = linspace(0, 0.1, 500);
x_a = 3 * sin(100 * %pi * t);
plot(t, x_a, "b");
xgrid();
title("1. Tin hieu tuong tu xa(t) trong 5 chu ky");
xlabel("Thoi gian t (s)");
ylabel("Bien do");

// 2 & 3. Tin hieu roi rac x(n) trong 5 chu ky (30 mau: n = 0..29)
subplot(3, 1, 2);
n = 0:29;
xn = 3 * sin(%pi * n / 3);
plot2d3(n, xn);
plot(n, xn, "r.");
xgrid();
title("2. Tin hieu roi rac x(n) trong 5 chu ky (N = 6, tong 30 mau)");
xlabel("Chi so mau n");
ylabel("Bien do");

// 4. Tin hieu luong tu hoa xq(n) voi Delta = 0.1 (Truncation)
subplot(3, 1, 3);
delta = 0.1;
xqn = floor(xn / delta) * delta;
plot2d3(n, xqn);
plot(n, xqn, "k.");
xgrid();
title("3. Tin hieu luong tu hoa xq(n) voi Delta = 0.1 (Truncated Method)");
xlabel("Chi so mau n");
ylabel("Bien do");
