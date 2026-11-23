// Lab 6 - plots for additional exercises 4.1, 4.2, 4.3, 4.4, 4.5, 4.9, 4.11
// Normalized parameters: A = 1, a = 1, tau = 1.
// Run: exec("additional_plots.sce");

clc;
d = get_absolute_file_path("additional_plots.sce");
chdir(d);

// stem plot in black
function mystem(n, v, ttl, xl)
    plot2d3(n, v, style=1);
    plot(n, v, "ko");
    xgrid();
    xtitle(ttl, xl, "");
    a = gca();                          // margin so edge stems are visible
    lo = min(0, min(v));  hi = max(0, max(v));  pad = 0.1 * max(hi - lo, 1);
    a.data_bounds = [min(n)-1, lo-pad; max(n)+1, hi+pad];
endfunction

// ---- 4.1(c): power density spectrum |c_k|^2 = 4/(pi^2 (1-4k^2)^2), F = k/tau
k = -6:6;
P = 4 ./ (%pi^2 * (1 - 4*k.^2).^2);
scf(11); clf();
mystem(k, P, "$|c_k|^2/A^2$", "$k\quad (F = k/\tau)$");
xs2pdf(gcf(), "fig/p4_1_psd.pdf");

// ---- 4.2: a = 1, A = 1
F = linspace(-2, 2, 1001);
Xa = 1 ./ (1 + %i*2*%pi*F);
Xb = 2 ./ (1 + (2*%pi*F).^2);
scf(12); clf();
subplot(2,2,1); plot(F, abs(Xa), "k-"); xgrid(); xtitle("$\mathrm{(a)}\ |X_a(F)|$", "$F\ \mathrm{(Hz)}$", "");
subplot(2,2,2); plot(F, atan(imag(Xa), real(Xa)), "k-"); xgrid(); xtitle("$\mathrm{(a)}\ \angle X_a(F)\ \mathrm{(rad)}$", "$F\ \mathrm{(Hz)}$", "");
subplot(2,2,3); plot(F, abs(Xb), "k-"); xgrid(); xtitle("$\mathrm{(b)}\ |X_a(F)|$", "$F\ \mathrm{(Hz)}$", "");
subplot(2,2,4); plot(F, zeros(F), "k-"); xgrid(); xtitle("$\mathrm{(b)}\ \angle X_a(F)\ \mathrm{(rad)}$", "$F\ \mathrm{(Hz)}$", "");
xs2pdf(gcf(), "fig/p4_2_spectrum.pdf");

// ---- 4.3(a): tau = 1, X(F) = tau sinc^2(F tau) >= 0
F = linspace(-4, 4, 2001);
s = ones(F);  idx = find(F <> 0);
s(idx) = sin(%pi*F(idx)) ./ (%pi*F(idx));
X3 = s.^2;
scf(13); clf();
subplot(2,1,1); plot(F, X3, "k-"); xgrid(); xtitle("$|X_a(F)|$", "$F\tau$", "");
subplot(2,1,2); plot(F, zeros(F), "k-"); xgrid(); xtitle("$\angle X_a(F)\ \mathrm{(rad)}$", "$F\tau$", "");
xs2pdf(gcf(), "fig/p4_3_spectrum.pdf");

// ---- 4.4(a): N = 6, one period x(0..5) = [3 2 1 0 1 2]
xp = [3 2 1 0 1 2];  N = 6;
n = -8:8;  xn = xp(pmodulo(n, N) + 1);
kk = 0:N-1;  ck = zeros(1, N);
for m = 0:N-1
    ck(m+1) = sum(xp .* exp(-%i*2*%pi*m*(0:N-1)/N)) / N;
end
mprintf("4.4 c_k = %s\n", strcat(string(clean(ck)), " "));
mprintf("4.4 power: time = %g, freq = %g\n", sum(xp.^2)/N, sum(abs(ck).^2));
ck = clean(ck);                       // drop round-off so zero c_k has zero phase
kp = -6:11;  ckp = ck(pmodulo(kp, N) + 1);
scf(14); clf();
subplot(3,1,1); mystem(n, xn, "$x(n)$", "n");
subplot(3,1,2); mystem(kp, abs(ckp), "$|c_k|$", "k");
subplot(3,1,3); mystem(kp, atan(imag(ckp), real(ckp)), "$\angle c_k\ \mathrm{(rad)}$", "k");
xs2pdf(gcf(), "fig/p4_4_spectrum.pdf");

// ---- 4.5(a): N = 8, PSD |c_k|^2
n = 0:7;
x5 = 2 + 2*cos(%pi*n/4) + cos(%pi*n/2) + 0.5*cos(3*%pi*n/4);
c5 = zeros(1, 8);
for m = 0:7
    c5(m+1) = sum(x5 .* exp(-%i*2*%pi*m*n/8)) / 8;
end
mprintf("4.5 c_k = %s\n", strcat(string(clean(real(c5))), " "));
mprintf("4.5 power: time = %g, freq = %g\n", sum(x5.^2)/8, sum(abs(c5).^2));
kp = -8:8;  P5 = abs(c5(pmodulo(kp, 8) + 1)).^2;
scf(15); clf();
mystem(kp, P5, "$|c_k|^2$", "k");
xs2pdf(gcf(), "fig/p4_5_psd.pdf");

// ---- 4.9 (a), (f), (g): DTFT by direct finite sums
w = linspace(-%pi, %pi, 2001);
function X = dtft(n, x, w)
    X = zeros(w);
    for i = 1:length(n)
        X = X + x(i) * exp(-%i*w*n(i));
    end
endfunction
na = 0:5;   Xa9 = dtft(na, ones(na), w);
nf = -4:4;  Xf9 = dtft(nf, 2 - 0.5 .^ nf, w);
ng = -2:2;  Xg9 = dtft(ng, ng, w);
scf(16); clf();
subplot(3,2,1); plot(w, abs(Xa9), "k-"); xgrid(); xtitle("$\mathrm{(a)}\ |X(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(3,2,2); plot(w, atan(imag(Xa9), real(Xa9)), "k-"); xgrid(); xtitle("$\mathrm{(a)}\ \angle X(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
subplot(3,2,3); plot(w, abs(Xf9), "k-"); xgrid(); xtitle("$\mathrm{(f)}\ |X(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(3,2,4); plot(w, atan(imag(Xf9), real(Xf9)), "k-"); xgrid(); xtitle("$\mathrm{(f)}\ \angle X(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
subplot(3,2,5); plot(w, abs(Xg9), "k-"); xgrid(); xtitle("$\mathrm{(g)}\ |X(\omega)|$", "$\omega\ \mathrm{(rad)}$", "");
subplot(3,2,6); plot(w, atan(imag(Xg9), real(Xg9)), "k-"); xgrid(); xtitle("$\mathrm{(g)}\ \angle X(\omega)\ \mathrm{(rad)}$", "$\omega\ \mathrm{(rad)}$", "");
xs2pdf(gcf(), "fig/p4_9_spectrum.pdf");

// ---- 4.11: y(n) = x_e(n+2) - j x_o(n), check against Y(w) = X_I(w) + X_R(w) e^{j2w}
nx = -3:1;  x = [1 0 -1 2 3];
X = dtft(nx, x, w);
Y = imag(X) + real(X) .* exp(2*%i*w);
ny = -5:3;  y = [0.5 0 1-0.5*%i 2 1+2*%i 0 0.5-2*%i 0 0.5*%i];
mprintf("4.11 max |DTFT(y) - Y| = %g\n", max(abs(dtft(ny, y, w) - Y)));
scf(17); clf();
subplot(2,1,1); mystem(ny, real(y), "$\mathrm{Re}\{y(n)\}$", "n");
subplot(2,1,2); mystem(ny, imag(y), "$\mathrm{Im}\{y(n)\}$", "n");
xs2pdf(gcf(), "fig/p4_11_signal.pdf");
