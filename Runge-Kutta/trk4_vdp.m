%Script that plots Van Der Pol Position and Phase for rk4

a = 5;
fcn = @vdp1;


t0 = 0;
nt = 2^12 + 1;
tmax = 100;
tspan = linspace(0.0, tmax, nt);
y0 = [1,-6]';
[tout, yout] = rk4(fcn, tspan, y0);

figure;
hold on
plot(tout, yout(:,1))
title('Position vs time for Van der Pol')
xlabel('Time') 
ylabel('Position') 
hold off

figure;
hold on
plot(yout(:,1), yout(:,2))
title('Phase graph for Van der Pol')
xlabel('Position') 
ylabel('Velocity') 
hold off