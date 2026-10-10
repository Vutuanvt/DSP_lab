clc;
clear;
clf();

// Define the original discrete-time signal x(n)
// x(-1) = x(0) = x(1) = x(2) = 1
// x(3) = x(4) = 1/2
// x(n) = 0 elsewhere

function y = xsignal(n)
    y = zeros(1, length(n));

    for i = 1:length(n)
        if n(i) >= -1 & n(i) <= 2 then
            y(i) = 1;
        elseif n(i) == 3 | n(i) == 4 then
            y(i) = 1/2;
        else
            y(i) = 0;
        end
    end
endfunction

// Define the time index
n = -6:8;

// Original signal x(n)
x = xsignal(n);

// (a) x(n - 2)
// Shift the signal to the right by 2 samples
xa = xsignal(n - 2);

// (b) x(4 - n)
// Time reversal followed by a shift
xb = xsignal(4 - n);

// (c) x(n + 2)
xc = xsignal(n + 2);


// (d) x(n)u(2 - n)
// u(2-n) = 1 for n <= 2
// u(2-n) = 0 for n > 2
u = zeros(1, length(n));

for i = 1:length(n)
    if n(i) <= 2 then
        u(i) = 1;
    else
        u(i) = 0;
    end
end

xd = x .* u;


// (e) x(n - 1)delta(n - 3)
// delta(n-3) = 1 when n = 3
// delta(n-3) = 0 elsewhere
delta = zeros(1, length(n));

for i = 1:length(n)
    if n(i) == 3 then
        delta(i) = 1;
    end
end

xe = xsignal(n - 1) .* delta;


// (f) x(n^2)
xf = xsignal(n.^2);


// (g) Even part of x(n)
// xe(n) = [x(n) + x(-n)] / 2
x_even = (xsignal(n) + xsignal(-n)) / 2;

// (h) Odd part of x(n)
// xo(n) = [x(n) - x(-n)] / 2
x_odd = (xsignal(n) - xsignal(-n)) / 2;


disp("Original signal x(n)");
disp(x);

disp("(a) x(n-2)");
disp(xa);

disp("(b) x(4-n)");
disp(xb);

disp("(c) x(n+2)");
disp(xc);

disp("(d) x(n)u(2-n)");
disp(xd);

disp("(e) x(n-1)delta(n-3)");
disp(xe);

disp("(f) x(n^2)");
disp(xf);

disp("(g) Even part xe(n)");
disp(x_even);

disp("(h) Odd part xo(n)");
disp(x_odd);


// Plot all signals

clf();

subplot(4,2,1);
plot2d3(n, x);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();

subplot(4,2,2);
plot2d3(n, xa);
xtitle("(a) x(n-2)", "n", "x(n-2)");
xgrid();

subplot(4,2,3);
plot2d3(n, xb);
xtitle("(b) x(4-n)", "n", "x(4-n)");
xgrid();

subplot(4,2,4);
plot2d3(n, xc);
xtitle("(c) x(n+2)", "n", "x(n+2)");
xgrid();

subplot(4,2,5);
plot2d3(n, xd);
xtitle("(d) x(n)u(2-n)", "n", "x(n)u(2-n)");
xgrid();

subplot(4,2,6);
plot2d3(n, xe);
xtitle("(e) x(n-1)delta(n-3)", "n", "x(n-1)delta(n-3)");
xgrid();

subplot(4,2,7);
plot2d3(n, xf);
xtitle("(f) x(n^2)", "n", "x(n^2)");
xgrid();

subplot(4,2,8);
plot2d3(n, x_even);
xtitle("(g) Even part of x(n)", "n", "xe(n)");
xgrid();



scf();

plot2d3(n, x_odd);
xtitle("(h) Odd part of x(n)", "n", "xo(n)");
xgrid();
