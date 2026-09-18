clc;
clear;
clf;

// Tao tin hieu x1(n)
// Mui ten nam o mau 0 => x1(0) = 0
n1 = 0:3;
x1 = [0 1 3 -2];

// Tao tin hieu x2(n)
// Mui ten nam o mau 1 => x2(0) = 1
n2 = -1:2;
x2 = [0 1 2 3];

// Can chinh hai tin hieu theo cung chi so n
n = -1:3;

x1_full = [0 0 1 3 -2];
x2_full = [0 1 2 3 0];

// Tinh y(n) = x1(n) + x2(n)
y = x1_full + x2_full;

// Ve tin hieu x1(n)
subplot(3,1,1);
plot2d3(n, x1_full);
plot(n, x1_full, "r.");
xgrid();
title("Tin hieu x_1(n)");
xlabel("Chi so n");
ylabel("Bien do");

// Ve tin hieu x2(n)
subplot(3,1,2);
plot2d3(n, x2_full);
plot(n, x2_full, "r.");
xgrid();
title("Tin hieu x_2(n)");
xlabel("Chi so n");
ylabel("Bien do");

// Ve tin hieu y(n)
subplot(3,1,3);
plot2d3(n, y);
plot(n, y, "r.");
xgrid();
title("Tin hieu y(n) = x_1(n) + x_2(n)");
xlabel("Chi so n");
ylabel("Bien do");
