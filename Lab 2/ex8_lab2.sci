n = -2:1;
x = [1 -2 3 6];

//y1(n) = x(-n)
n1 = -n($:-1:1);
y1 = x($:-1:1);

//y2(n) = x(n+3)
n2 = n - 3;
y2 = x;

//y3(n) = 2x(-n-2)
n3 = -n($:-1:1) - 2;
y3 = 2 * x($:-1:1);

//plot x(n) and y1(n)
scf(1);

subplot(2,1,1);
plot2d3(n, x);
title("x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(2,1,2);
plot2d3(n1, y1);
title("y1(n) = x(-n)");
xlabel("n");
ylabel("Amplitude");

//plot x(n) and y2(n)
scf(2);

subplot(2,1,1);
plot2d3(n, x);
title("x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(2,1,2);
plot2d3(n2, y2);
title("y2(n) = x(n+3)");
xlabel("n");
ylabel("Amplitude");

//plot x(n) and y3(n)
scf(3);

subplot(2,1,1);
plot2d3(n, x);
title("x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(2,1,2);
plot2d3(n3, y3);
title("y3(n) = 2x(-n-2)");
xlabel("n");
ylabel("Amplitude");

//print signals
disp("y1(n) =");
disp(y1);

disp("y2(n) =");
disp(y2);

disp("y3(n) =");
disp(y3);
