function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    //time indices
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    //common time axis
    n_start = min([n1 n2]);
    n_end = max([n1 n2]);
    n = n_start:n_end;

    //initialize aligned signals
    x1 = zeros(1, length(n));
    x2 = zeros(1, length(n));

    //convert time indices to vector positions
    index1 = n1 - n_start + 1;
    index2 = n2 - n_start + 1;

    //place samples on the common time axis
    x1(index1) = x1n;
    x2(index2) = x2n;

    //sample-wise multiplication
    yn = x1 .* x2;

    //position of n = 0
    yorigin = 1 - n_start;

    //plot x1
    scf(1);
    clf();

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
    plot2d3(n, yn);
    title("y(n) = x1(n)x2(n)");
    xlabel("n");
    ylabel("Amplitude");
endfunction

//given signals
x1n = [2 3 4];
x1origin = 2;

x2n = [10 20 30];
x2origin = 3;

//multiply signals
[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);

//print y
disp("y(n) =");
disp(yn);

//print origin
disp("yorigin =");
disp(yorigin);
