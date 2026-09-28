clc;
close;
clear;
clf;

function [yn, yorigin] = advance (xn, xorigin, k)
    if k <= 0 then
        error("Gia tri k phai lon hon 0.");
    end
    
    yn = xn;
    yorigin = xorigin + k;
    n_x = (1:length(xn)) - xorigin; // Truc thoi gian x(n)
    n_y = (1:length(yn)) - yorigin; // Truc thoi gian y(n)

    // Ve tin hieu goc x(n)
    subplot(2, 1, 1);
    plot2d3(n_x, xn, style=2);
    plot(n_x, xn, "r.");
    xtitle("Tin hieu goc x(n)", "n", "x(n)");
    xgrid();

    // Ve tin hieu tien y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn, style=5);
    plot(n_y, yn, "b.");
    xtitle("Tin hieu tien y(n) = x(n + " + string(k) + ")", "n", "y(n)");
    xgrid();
endfunction

// Test
[yn, yorigin] = advance ([1, -2, 3, 6], 3, 1);
mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);
