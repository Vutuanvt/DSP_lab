function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    //time indices
    n1 = (1:length(xn)) - xorigin;
    n2 = (1:length(hn)) - horigin;

    //output time axis
    n_start = min(n1) + min(n2);
    n_end = max(n1) + max(n2);
    n = n_start:n_end;

    //initialize output
    yn = zeros(1, length(n));

    //multiply each sample pair and accumulate
    for i = 1:length(xn)
        for j = 1:length(hn)
            //output time is the sum of input times
            nk = n1(i) + n2(j);

            //convert time index to vector position
            index = nk - n_start + 1;

            //add this pair contribution to the output
            yn(index) = yn(index) + xn(i) * hn(j);
        end
    end

    //position of n = 0
    yorigin = 1 - n_start;

    //plot x
    scf(1);
    clf();

    subplot(3,1,1);
    plot2d3(n1, xn);
    title("x(n)");
    xlabel("n");
    ylabel("Amplitude");

    //plot h
    subplot(3,1,2);
    plot2d3(n2, hn);
    title("h(n)");
    xlabel("n");
    ylabel("Amplitude");

    //plot y
    subplot(3,1,3);
    plot2d3(n, yn);
    title("y(n) = x(n) * h(n)");
    xlabel("n");
    ylabel("Amplitude");
endfunction

//given signals
xn = [2 3];
xorigin = 1;

hn = [1 4];
horigin = 1;

//convolve signals
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

//print y
disp("y(n) =");
disp(yn);

//print origin
disp("yorigin =");
disp(yorigin);
