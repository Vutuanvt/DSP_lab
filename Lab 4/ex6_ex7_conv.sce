// Lab 4 - Ex6 (linear conv) and Ex7 (circular conv)
// Run: exec("ex6_ex7_conv.sce");   Each method is written by hand, conv/fft only used to check.

clc;
d = get_absolute_file_path("ex6_ex7_conv.sce");
chdir(d);

// stem plot helper: n = index, v = values
function mystem(n, v, ttl)
    plot2d3(n, v);
    plot(n, v, "o");
    xgrid();
    xlabel("n");
    title(ttl);
endfunction

// ======================= Exercise 6: linear convolution =======================
x  = [1 2 -3 2 1];   nx = 0:length(x)-1;     // first element is n = 0
h  = [1 0 -1];       nh = 0:length(h)-1;
Lx = length(x);  Lh = length(h);  Ly = Lx + Lh - 1;
ny = 0:Ly-1;

// Method 1: folding and shifting. y(n) = sum_k h(k) x(n-k)
// x(n-k) = x folded then shifted by n; only the overlapping part contributes.
y1 = zeros(1, Ly);
for n = 0:Ly-1
    s = 0;
    for k = 0:Lh-1
        m = n - k;
        if m >= 0 & m <= Lx-1 then
            s = s + h(k+1) * x(m+1);
        end
    end
    y1(n+1) = s;
end

// Method 2: matrix. Column j of H = h shifted down by j-1, so y = H * x'
H = zeros(Ly, Lx);
for j = 1:Lx
    H(j:j+Lh-1, j) = h(:);
end
y2 = (H * x')';

mprintf("--- Ex6 ---\n");
mprintf("folding/shifting: %s\n", strcat(string(y1), " "));
mprintf("matrix          : %s\n", strcat(string(y2), " "));
mprintf("check vs conv   : max|diff| = %g , %g\n", max(abs(y1 - conv(x,h))), max(abs(y2 - conv(x,h))));

Ex = sum(x.^2);  Ey = sum(y1.^2);
mprintf("energy: Ex = %g, Ey = %g\n", Ex, Ey);

scf(1); clf();
subplot(2,2,1); mystem(nx, x,    "x(n)");
subplot(2,2,2); mystem(ny, y1,   "y(n) = x(n) * h(n)");
subplot(2,2,3); mystem(nx, x.^2,  msprintf("x(n)^2, Ex = %g", Ex));
subplot(2,2,4); mystem(ny, y1.^2, msprintf("y(n)^2, Ey = %g", Ey));
xs2png(gcf(), "ex6_linear_conv.png");

// ======================= Exercise 7: circular convolution =======================
h7 = [1 0 -1 -1 1];
N  = length(x);  M = length(h7);
hp = [h7, zeros(1, N-M)];            // zero-pad h to length N if M < N (M > N not handled)
n7 = 0:N-1;

// Method 1: folding and shifting with wrap-around. y(n) = sum_k h(k) x[(n-k) mod N]
// pmodulo keeps the index non-negative (modulo can return negative in Scilab)
y3 = zeros(1, N);
for n = 0:N-1
    s = 0;
    for k = 0:M-1
        s = s + h7(k+1) * x(pmodulo(n-k, N) + 1);
    end
    y3(n+1) = s;
end

// Method 2: circulant matrix. C(i,j) = h[(i-j) mod N], so y = C * x'
C = zeros(N, N);
for i = 1:N
    for j = 1:N
        C(i,j) = hp(pmodulo(i-j, N) + 1);
    end
end
y4 = (C * x')';

// independent check: circular conv in time = product in DFT domain
yf = real(ifft(fft(x) .* fft(hp)));

mprintf("--- Ex7 ---\n");
mprintf("folding/shifting: %s\n", strcat(string(y3), " "));
mprintf("circulant matrix: %s\n", strcat(string(y4), " "));
mprintf("check vs ifft(fft.*fft): max|diff| = %g , %g\n", max(abs(y3 - yf)), max(abs(y4 - yf)));

Ey7 = sum(y3.^2);
mprintf("energy: Ex = %g, Ey = %g\n", Ex, Ey7);

scf(2); clf();
subplot(2,2,1); mystem(n7, x,    "x(n)");
subplot(2,2,2); mystem(n7, y3,   "y(n) circular, N = 5");
subplot(2,2,3); mystem(n7, x.^2,  msprintf("x(n)^2, Ex = %g", Ex));
subplot(2,2,4); mystem(n7, y3.^2, msprintf("y(n)^2, Ey = %g", Ey7));
xs2png(gcf(), "ex7_circular_conv.png");

mprintf("saved: ex6_linear_conv.png, ex7_circular_conv.png\n");
