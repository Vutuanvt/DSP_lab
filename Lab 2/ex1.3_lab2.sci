clc;
clear;
clf;

// (a) xa(t) = 3*cos(5t + pi/6) -> T0 = 2*pi/5 s (~1.257 s)
subplot(5, 1, 1);
T0 = 2 * %pi / 5;
t = linspace(0, 3 * T0, 1000);
xa = 3 * cos(5 * t + %pi / 6);
plot(t, xa, "b");
xgrid();
title("(a) xa(t) = 3*cos(5t + pi/6) [TUAN HOAN: T0 = 2*pi/5 s ~ 1.257 s]");
xlabel("t (s)");
ylabel("xa(t)");

// (b) x(n) = 3*cos(5n + pi/6) -> Khong tuan hoan
subplot(5, 1, 2);
nb = 0:39;
xb = 3 * cos(5 * nb + %pi / 6);
plot2d3(nb, xb);
plot(nb, xb, "r.");
xgrid();
title("(b) x(n) = 3*cos(5n + pi/6) [KHONG TUAN HOAN - w0/(2*pi) la so vo ti]");
xlabel("n (mau)");
ylabel("xb(n)");

// (c) x(n) = 2*exp(j*(n/6 - pi)) -> Khong tuan hoan (ve phan thuc)
subplot(5, 1, 3);
nc = 0:39;
xc = 2 * exp(%i * (nc / 6 - %pi));
plot2d3(nc, real(xc));
plot(nc, real(xc), "m.");
xgrid();
title("(c) x(n) = 2*exp(j*(n/6 - pi)) [KHONG TUAN HOAN - Re{x(n)}]");
xlabel("n (mau)");
ylabel("Re{xc(n)}");

// (d) x(n) = cos(n/8)*cos(pi*n/8) -> Khong tuan hoan
subplot(5, 1, 4);
nd = 0:49;
xd = cos(nd / 8) .* cos(%pi * nd / 8);
plot2d3(nd, xd);
plot(nd, xd, "c.");
xgrid();
title("(d) x(n) = cos(n/8)*cos(pi*n/8) [KHONG TUAN HOAN]");
xlabel("n (mau)");
ylabel("xd(n)");

// (e) x(n) -> Tuan hoan voi N0 = 16 mau (ve 3 chu ky = 48 mau)
subplot(5, 1, 5);
ne = 0:47;
xe = cos(%pi * ne / 2) - sin(%pi * ne / 8) + 3 * cos(%pi * ne / 4 + %pi / 3);
plot2d3(ne, xe);
plot(ne, xe, "g.");
xgrid();
title("(e) x(n) = cos(pi*n/2) - sin(pi*n/8) + 3*cos(...) [TUAN HOAN: N0 = 16 mau]");
xlabel("n (mau)");
ylabel("xe(n)");
