// Lab 6 - Ex4: H(w) of y(n) + 0.1 y(n-1) + 0.2 y(n-2) = x(n)
// Run: exec("ex4_lti_spectrum.sce");

clc;
d = get_absolute_file_path("ex4_lti_spectrum.sce");
chdir(d);

a = [1 0.1 0.2];                          // denominator coefficients a0, a1, a2
mprintf("|poles| = %s\n", strcat(string(abs(roots(a))), " "));

w = linspace(-%pi, %pi, 2001);
D = a(1) + a(2)*exp(-%i*w) + a(3)*exp(-2*%i*w);
H = 1 ./ D;

// cross-check with closed-form magnitude
magcf = 1 ./ sqrt(1.05 + 0.24*cos(w) + 0.4*cos(2*w));
mprintf("max | |H| - closed form | = %g\n", max(abs(abs(H) - magcf)));

// cross-check with h(n) from filter(): sum h(n) e^{-jwn} with 60 samples
h = filter(1, a, [1 zeros(1, 59)]);
Hs = zeros(w);
for k = 1:60
    Hs = Hs + h(k) * exp(-%i*w*(k-1));
end
mprintf("max |H - DTFT(h)| = %g\n", max(abs(H - Hs)));

scf(2); clf();
subplot(2,1,1); plot(w, abs(H), "k-"); xgrid(); xtitle("$|H(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(2,1,2); plot(w, atan(imag(H), real(H)), "k-"); xgrid(); xtitle("$\angle H(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
xs2pdf(gcf(), "fig/ex4_spectrum.pdf");
