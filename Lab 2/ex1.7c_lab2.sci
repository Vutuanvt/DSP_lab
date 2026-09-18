clc;
clear;
clf;

// Tan so lay mau
Fs = 9000;

// Tan so tin hieu
F2 = 9000;

// Tao chi so mau
n = 0:20;

// Tao tin hieu roi rac
x = cos(2*%pi*F2*n/Fs);

// Tao tin hieu DC tuong ung
x_dc = ones(1, length(n));

// Ve tin hieu 9 kHz sau khi lay mau
subplot(2,1,1);
plot2d3(n, x);
plot(n, x, "r.");
xgrid();
title("Tin hieu 9 kHz voi Fs = 9 kHz");
xlabel("Chi so n");
ylabel("Bien do");

// Ve tin hieu DC
subplot(2,1,2);
plot2d3(n, x_dc);
plot(n, x_dc, "r.");
xgrid();
title("Tin hieu DC tuong ung 0 Hz");
xlabel("Chi so n");
ylabel("Bien do");
