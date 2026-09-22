n = -1:3;

x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];

//sample-wise multiplication
y = x1 .* x2;

//plot x1
subplot(3,1,1);
plot2d3(n, x1);
title("x1(n)");
xlabel("n");
ylabel("Amplitude");

//plot x2
subplot(3,1,2);
plot2d3(n, x2);
title("x2(n)");
xlabel("n");
ylabel("Amplitude");

//plot y
subplot(3,1,3);
plot2d3(n, y);
title("y(n) = x1(n)x2(n)");
xlabel("n");
ylabel("Amplitude");

//print y
disp("y(n) =");
disp(y);
