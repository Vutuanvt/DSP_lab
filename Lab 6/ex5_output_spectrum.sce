// Lab 6 - Ex5: h(n) = d(n) + d(n-1), x(n) = 0.5^n u(n), Y(w) = H(w) X(w)
// Run: exec("ex5_output_spectrum.sce");

clc;
d = get_absolute_file_path("ex5_output_spectrum.sce");
chdir(d);

// time-domain check: y(n) = 3 (0.5)^n u(n) - 2 d(n)
N = 20;  n = 0:N-1;
x = 0.5 .^ n;
y = conv(x, [1 1]);  y = y(1:N);
yt = 3 * 0.5 .^ n;  yt(1) = yt(1) - 2;
mprintf("y(0..4) = %s\n", strcat(string(y(1:5)), " "));
mprintf("max |conv - closed form| = %g\n", max(abs(y - yt)));

w = linspace(-%pi, %pi, 2001);
Y = (1 + exp(-%i*w)) ./ (1 - 0.5*exp(-%i*w));

scf(3); clf();
subplot(2,1,1); plot(w, abs(Y), "k-"); xgrid(); xtitle("$|Y(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(2,1,2); plot(w, atan(imag(Y), real(Y)), "k-"); xgrid(); xtitle("$\angle Y(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
xs2pdf(gcf(), "fig/ex5_spectrum.pdf");
