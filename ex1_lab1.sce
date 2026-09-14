// Y 1: Tao vector (x1 + 1, x2 + 1, x3 + 1, x4 + 1) tu x = 1:4
x = 1:4;
res1 = x + 1;
disp("--- Ket qua Y 1 (x + 1) ---");
disp(res1);
// Y 2: Tao vector (x1*y1, x2*y2, x3*y3, x4*y4) voi x = 1:4 va y = 5:8
y = 5:8;
res2 = x .* y;
disp("--- Ket qua Y 2 (x .* y) ---");
disp(res2);
// Y 3: Tao vector (sin(x1), ..., sin(x10)) voi x gom 10 gia tri trong [0, pi]
x_sub = linspace(0, %pi, 10);
res3 = sin(x_sub);
disp("--- Ket qua Y 3 (sin(x) tren [0, pi]) ---");
disp(res3);
