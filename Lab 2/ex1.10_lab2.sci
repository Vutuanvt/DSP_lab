//given values
Rb = 10000;
L = 1024;

//analog angular frequencies
Omega1 = 600 * %pi;
Omega2 = 1800 * %pi;

//convert rad/s to hz
f1 = Omega1 / (2 * %pi);
f2 = Omega2 / (2 * %pi);

//(a) sampling and folding frequency
bits_per_sample = log2(L);
fs = Rb / bits_per_sample;
f_fold = fs / 2;

//(b) nyquist sampling rate
fmax = max([f1 f2]);
fs_nyquist = 2 * fmax;

//(c) discrete-time frequencies
omega1 = 2 * %pi * f1 / fs;
omega2 = 2 * %pi * f2 / fs;

//alias omega2 into [-pi, pi]
omega2_alias = omega2 - 2 * %pi;

//sampled signal
n = 0:10;
x1 = 3 * cos(omega1 * n);
x2 = 2 * cos(omega2 * n);
x = x1 + x2;

//equivalent aliased signal
x_alias = 3 * cos(omega1 * n) + 2 * cos(omega2_alias * n);

//(d) quantization resolution
xmax = 3 + 2;
xmin = -3 - 2;
delta = (xmax - xmin) / (L - 1);

//print analog frequencies
disp("f1 (hz) =");
disp(f1);

disp("f2 (hz) =");
disp(f2);

//print part a
disp("bits per sample =");
disp(bits_per_sample);

disp("sampling frequency (hz) =");
disp(fs);

disp("folding frequency (hz) =");
disp(f_fold);

//print part b
disp("nyquist sampling rate (hz) =");
disp(fs_nyquist);

//print part c
disp("omega1 / pi =");
disp(omega1 / %pi);

disp("omega2 / pi =");
disp(omega2 / %pi);

disp("omega2 alias / pi =");
disp(omega2_alias / %pi);

//print sampled signal
disp("n, x(n)");
disp([n' x']);

//print part d
disp("quantization resolution =");
disp(delta);

//plot sampled signal
scf(1);

subplot(2,1,1);
plot2d3(n, x);
title("x(n)");
xlabel("n");
ylabel("Amplitude");

//plot equivalent aliased signal
subplot(2,1,2);
plot2d3(n, x_alias);
title("x(n) after aliasing");
xlabel("n");
ylabel("Amplitude");
