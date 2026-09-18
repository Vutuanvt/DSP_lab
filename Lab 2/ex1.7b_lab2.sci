clc;
clear;
clf;

// Tan so lay mau
Fs = 8000;

// Tan so ban dau
F1 = 5000;

// Tan so alias
Falias = abs(Fs - F1);

// Tao chi so mau
n = 0:20;

// Tao hai tin hieu roi rac
x1 = cos(2*%pi*F1*n/Fs);
x2 = cos(2*%pi*Falias*n/Fs);

// Ve tin hieu 5 kHz
subplot(2,1,1);
plot2d3(n, x1);
plot(n, x1, "r.");
xgrid();
title("Tin hieu 5 kHz voi Fs = 8 kHz");
xlabel("Chi so n");
ylabel("Bien do");

// Ve tin hieu alias 3 kHz
subplot(2,1,2);
plot2d3(n, x2);
plot(n, x2, "r.");
xgrid();
title("Tin hieu alias tuong ung 3 kHz");
xlabel("Chi so n");
ylabel("Bien do");
