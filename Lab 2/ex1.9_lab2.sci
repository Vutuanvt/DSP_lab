//sampling rate
fs = 600;
Ts = 1 / fs;

//analog angular frequencies
Omega1 = 480 * %pi;
Omega2 = 720 * %pi;

//convert rad/s to hz
f1 = Omega1 / (2 * %pi);
f2 = Omega2 / (2 * %pi);

//(a) nyquist sampling rate
fmax = max([f1 f2]);
fs_nyquist = 2 * fmax;

//(b) folding frequency
f_fold = fs / 2;

//(c) discrete-time frequencies
omega1 = 2 * %pi * f1 / fs;
omega2 = 2 * %pi * f2 / fs;

//alias omega2
omega2_alias = omega2 - 2 * %pi;

//sampled signal
n = 0:10;
x1 = sin(omega1 * n);
x2 = 3 * sin(omega2 * n);
x = x1 + x2;

//equivalent aliased signal
x_alias = -2 * sin(omega1 * n);

//(d) reconstructed analog signal
f_reconstructed = 240;
Omega_reconstructed = 2 * %pi * f_reconstructed;

//print input
disp("f1 (hz) =");
disp(f1);

disp("f2 (hz) =");
disp(f2);

//print part a
disp("nyquist sampling rate (hz) =");
disp(fs_nyquist);

//print part b
disp("folding frequency (hz) =");
disp(f_fold);

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
disp("reconstructed frequency (hz) =");
disp(f_reconstructed);

disp("reconstructed angular frequency / pi =");
disp(Omega_reconstructed / %pi);

//plot sampled signal
scf(1);

subplot(2,1,1);
plot2d3(n, x);
title("x(n)");
xlabel("n");
ylabel("Amplitude");

//plot reconstructed signal
t = 0:0.00005:0.02;
ya = -2 * sin(Omega_reconstructed * t);

subplot(2,1,2);
plot(t, ya);
title("ya(t) = -2sin(480*pi*t)");
xlabel("t (s)");
ylabel("Amplitude");
