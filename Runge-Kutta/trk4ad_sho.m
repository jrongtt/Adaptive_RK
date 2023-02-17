%Script that makes an error graph forr SHO estime versus soltuion for
% multiple relative toleranceces

fcn = @sho;
t0 = 0;
nt = 2^6 + 1;

tmax = 3*pi;
tspan = linspace(0.0, 3.0 * pi, 65);
y0 = [0, 1]';

figure;

hold on 

reltol = 10^(-5);
[tout5 yout5] =  rk4ad(fcn, tspan, reltol, y0);

reltol = 10^(-7);
[tout7 yout7] =  rk4ad(fcn, tspan, reltol, y0);

reltol = 10^(-9);
[tout9 yout9] =  rk4ad(fcn, tspan, reltol, y0);

reltol = 10^(-11);
[tout11 yout11] =  rk4ad(fcn, tspan, reltol, y0);


plot(tout5, sin(tout5)' - yout5(:,1),'r')
plot(tout5, sin(tout5)' - yout7(:,1),'b')
plot(tout5, sin(tout5)' - yout9(:,1),'y')
plot(tout5, sin(tout5)' - yout11(:,1),'black')


title('Error for different rel tol (Simple Harmonic Oscillator)')
xlabel('time') 
ylabel('Error relative to sin(x)') 
legend({'reltol = 1e-5','reltol = 1e-7','reltol = 1e-9', 'relto = 1e-11'},'Location','southwest')
hold off