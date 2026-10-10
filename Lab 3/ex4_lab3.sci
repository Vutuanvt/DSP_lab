function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)

    // Check input
    if x1origin < 1 | x1origin > length(x1n) then
        error("x1origin is out of range.")
    end

    if x2origin < 1 | x2origin > length(x2n) then
        error("x2origin is out of range.")
    end

    // Determine the n-range of x1(n)
    n1_start = 1 - x1origin;
    n1_end = length(x1n) - x1origin;

    // Determine the n-range of x2(n)
    n2_start = 1 - x2origin;
    n2_end = length(x2n) - x2origin;

    // Determine the common n-range
    n_start = min(n1_start, n2_start);
    n_end = max(n1_end, n2_end);

    // Common n-axis
    n = n_start:n_end;

    // Initialize signals with zeros
    x1 = zeros(1, length(n));
    x2 = zeros(1, length(n));

    // Put x1(n) into the common n-axis
    for k = 1:length(x1n)
        nk = k - x1origin;
        index = nk - n_start + 1;
        x1(index) = x1n(k);
    end

    // Put x2(n) into the common n-axis
    for k = 1:length(x2n)
        nk = k - x2origin;
        index = nk - n_start + 1;
        x2(index) = x2n(k);
    end

    // Addition
    yn = x1 + x2;

    // Position of n = 0
    yorigin = 1 - n_start;

    // Display results
    disp("x1(n) = ");
    disp(x1);

    disp("x2(n) = ");
    disp(x2);

    disp("y(n) = x1(n) + x2(n) = ");
    disp(yn);

    disp("yorigin = ");
    disp(yorigin);

    // Plot
    clf();

    subplot(3,1,1);
    plot2d3(n, x1);
    xtitle("Signal x1(n)", "n", "x1(n)");
    xgrid();

    subplot(3,1,2);
    plot2d3(n, x2);
    xtitle("Signal x2(n)", "n", "x2(n)");
    xgrid();

    subplot(3,1,3);
    plot2d3(n, yn);
    xtitle("Output signal y(n) = x1(n) + x2(n)", "n", "y(n)");
    xgrid();

endfunction

x1n = [1 2 3 4];
x1origin = 2;

x2n = [5 6 7];
x2origin = 1;

[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);

disp("yn = ");
disp(yn);

disp("yorigin = ");
disp(yorigin);
