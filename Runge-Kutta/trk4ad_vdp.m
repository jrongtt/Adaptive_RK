%Script that graphs Van der Pol using adaptive Runge-Kutta method

a = 5;
fcn = @vdp1;


t0 = 0;
reltol = 10^(-5);
tmax = 100;
tspan = linspace(0.0, tmax, 4097);
y0 = [1,-6]';
[tout, yout] = rk4ad(fcn, tspan, reltol, y0);

figure;
hold on
plot(tout, yout(:,1))
title('Position vs time for Van der Pol')
xlabel('Time') 
ylabel('Position') 
hold off

figure;
hold on

xlabel('Position')
ylabel('Velocity')
title('Phase graph: Van Der Pol')
plot(yout(:,1), yout(:,2))
hold off



