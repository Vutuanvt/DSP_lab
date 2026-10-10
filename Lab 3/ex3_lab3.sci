function [yn, yorigin] = fold(xn, xorigin)
    // Check input
    if xorigin < 1 | xorigin > length(xn) then
        error("xorigin is out of range.")
    end

    // Folding operation: y(n) = x(-n)
    yn = xn($:-1:1);

    // Calculate the new origin position
    yorigin = length(xn) - xorigin + 1;

    // Plot original signal
    n1 = (1:length(xn)) - xorigin;
    n2 = (1:length(yn)) - yorigin;

    clf();

    subplot(2,1,1);
    plot2d3(n1, xn);
    xtitle("Original signal x(n)", "n", "x(n)");
    xgrid();

    subplot(2,1,2);
    plot2d3(n2, yn);
    xtitle("Folded signal y(n) = x(-n)", "n", "y(n)");
    xgrid();
endfunction

xn = [1 2 3 4 5];
xorigin = 3;

[yn, yorigin] = fold(xn, xorigin);

disp("yn = ");
disp(yn);

disp("yorigin = ");
disp(yorigin);
