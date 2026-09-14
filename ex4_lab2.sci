n = -5:5;

// Generate the unit ramp signal ur(n)
ur = zeros(1, length(n));

for i = 1:length(n)
    if n(i) >= 0 then
        ur(i) = n(i); // ur(n) = n for n >= 0
    end
end

plot2d3(n, ur, style = 2);
xlabel("n");
ylabel("Amplitude");
title("Unit Ramp Signal");
gca().children.children.thickness = 3;
xgrid();
