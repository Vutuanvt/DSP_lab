//given input: x(n) = 1 for 0 <= n <= 3, zero elsewhere
//evaluate x at time indices, not at Scilab vector positions
function xn = lab26_input(n)
    //convert true to 1 and false to 0
    xn = bool2s((n >= 0) & (n <= 3));
endfunction

//given values
k = 2;
n = -4:6;

//original input
x = lab26_input(n);

//delayed input: xd(n) = x(n - k)
x_shift = lab26_input(n - k);

//(a) system 1: y(n) = x(n^2)
//delay input then apply system: yd(n) = xd(n^2) = x(n^2 - k)
//apply system then delay output: y(n - k) = x((n - k)^2)
//these two expressions are not equal for all inputs and shifts

//(b.1) x(n) is defined above

//(b.2) original output: read x at n^2
y1 = lab26_input(n.^2);

//(b.3) delayed output: replace n in y(n) by n - k
y1_shift = lab26_input((n - k).^2);

//(b.4) delayed input x_shift is defined above

//(b.5) output of delayed input: read xd at n^2
y1_shift_input = lab26_input(n.^2 - k);

//(b.6) compare the two processing orders
diff1 = y1_shift_input - y1_shift;

//counterexample for k = 2, n = 1
//yd(1) = x(-1) = 0, but y(1 - 2) = x(1) = 1
disp("(a), (b): y(n) = x(n^2)");
disp("delay input then apply system: x(n^2 - k)");
disp("apply system then delay output: x((n - k)^2)");
disp("n, x(n), y(n), y(n-k), xd(n), yd(n)");
disp([n' x' y1' y1_shift' x_shift' y1_shift_input']);
disp("maximum absolute difference =");
disp(max(abs(diff1)));
disp("not time invariant: the given input provides a counterexample.");

//plot system 1
scf(2);
clf();

subplot(3,2,1);
plot2d3(n, x);
title("(b.1) x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,2);
plot2d3(n, y1);
title("(b.2) y(n) = x(n^2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,3);
plot2d3(n, y1_shift);
title("(b.3) y(n - 2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,4);
plot2d3(n, x_shift);
title("(b.4) xd(n) = x(n - 2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,5);
plot2d3(n, y1_shift_input);
title("(b.5) yd(n) = xd(n^2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,6);
plot2d3(n, diff1);
title("(b.6) yd(n) - y(n - 2)");
xlabel("n");
ylabel("Difference");

//(c) system 2: y(n) = x(n) - x(n - 1)
//delay input then apply system:
//yd(n) = xd(n) - xd(n - 1) = x(n - k) - x(n - 1 - k)
//apply system then delay output:
//y(n - k) = x(n - k) - x(n - k - 1)
//the expressions are equal for every input and integer shift k

//original output
y2 = x - lab26_input(n - 1);

//delayed output
y2_shift = lab26_input(n - k) - lab26_input(n - k - 1);

//output of delayed input
y2_shift_input = x_shift - lab26_input((n - 1) - k);

//compare the two processing orders
diff2 = y2_shift_input - y2_shift;

disp("(c): y(n) = x(n) - x(n - 1)");
disp("both processing orders give x(n - k) - x(n - k - 1).");
disp("n, x(n), y(n), y(n-k), xd(n), yd(n)");
disp([n' x' y2' y2_shift' x_shift' y2_shift_input']);
disp("maximum absolute difference =");
disp(max(abs(diff2)));
disp("time invariant: proved by the general expressions above.");
disp("a matching plot for one input alone is not a general proof.");

//plot system 2
scf(3);
clf();

subplot(3,2,1);
plot2d3(n, x);
title("(c.1) x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,2);
plot2d3(n, y2);
title("(c.2) y(n) = x(n) - x(n - 1)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,3);
plot2d3(n, y2_shift);
title("(c.3) y(n - 2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,4);
plot2d3(n, x_shift);
title("(c.4) xd(n) = x(n - 2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,5);
plot2d3(n, y2_shift_input);
title("(c.5) yd(n) = xd(n) - xd(n - 1)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,6);
plot2d3(n, diff2);
title("(c.6) yd(n) - y(n - 2)");
xlabel("n");
ylabel("Difference");

//(d) system 3: y(n) = n*x(n)
//delay input then apply system: yd(n) = n*x(n - k)
//apply system then delay output: y(n - k) = (n - k)*x(n - k)
//difference = k*x(n - k), which is not always zero

//original output
y3 = n .* x;

//delayed output: replace n in both factors by n - k
y3_shift = (n - k) .* lab26_input(n - k);

//output of delayed input: the system still multiplies by n
y3_shift_input = n .* x_shift;

//compare the two processing orders
diff3 = y3_shift_input - y3_shift;

disp("(d): y(n) = n*x(n)");
disp("delay input then apply system: n*x(n - k)");
disp("apply system then delay output: (n - k)*x(n - k)");
disp("difference = k*x(n - k), which is not always zero.");
disp("n, x(n), y(n), y(n-k), xd(n), yd(n)");
disp([n' x' y3' y3_shift' x_shift' y3_shift_input']);
disp("maximum absolute difference =");
disp(max(abs(diff3)));
disp("not time invariant: the given input provides a counterexample.");

//plot system 3
scf(4);
clf();

subplot(3,2,1);
plot2d3(n, x);
title("(d.1) x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,2);
plot2d3(n, y3);
title("(d.2) y(n) = n*x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,3);
plot2d3(n, y3_shift);
title("(d.3) y(n - 2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,4);
plot2d3(n, x_shift);
title("(d.4) xd(n) = x(n - 2)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,5);
plot2d3(n, y3_shift_input);
title("(d.5) yd(n) = n*xd(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3,2,6);
plot2d3(n, diff3);
title("(d.6) yd(n) - y(n - 2)");
xlabel("n");
ylabel("Difference");
