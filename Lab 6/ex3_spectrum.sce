// Lab 6 - Ex3: amplitude and phase spectrum of x1(n) = 0.1^n u(n) and x2(n) = d(n)+d(n-1)+d(n-2)+d(n-3)
// Run: exec("ex3_spectrum.sce");

clc;
d = get_absolute_file_path("ex3_spectrum.sce");
chdir(d);

w = linspace(-%pi, %pi, 2001);           // one period of omega

// x1: closed form X1(w) = 1 / (1 - 0.1 e^{-jw})
X1 = 1 ./ (1 - 0.1*exp(-%i*w));

// x2: finite length, compute DTFT sum directly
n2 = 0:3;  x2 = [1 1 1 1];
X2 = zeros(w);
for k = 1:length(n2)
    X2 = X2 + x2(k) * exp(-%i*w*n2(k));
end

scf(1); clf();
subplot(2,2,1); plot(w, abs(X1), "k-"); xgrid(); xtitle("$|X_1(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(2,2,2); plot(w, atan(imag(X1), real(X1)), "k-"); xgrid(); xtitle("$\angle X_1(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
subplot(2,2,3); plot(w, abs(X2), "k-"); xgrid(); xtitle("$|X_2(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(2,2,4); plot(w, atan(imag(X2), real(X2)), "k-"); xgrid(); xtitle("$\angle X_2(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
xs2pdf(gcf(), "fig/ex3_spectrum.pdf");

// check against the closed forms derived in the report
mprintf("|X1(0)| = %g (expect %g)\n", abs(X1(1001)), 1/0.9);    // w(1001) = 0
idx = find(abs(sin(w/2)) > 1e-9);
X2cf = exp(-1.5*%i*w(idx)) .* sin(2*w(idx)) ./ sin(w(idx)/2);
mprintf("max |X2 - closed form| = %g\n", max(abs(X2(idx) - X2cf)));
