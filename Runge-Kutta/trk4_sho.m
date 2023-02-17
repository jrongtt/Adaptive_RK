% Script that plots errors of rk4 for SHO


fcn = @sho;
t0 = 0;
tmax = 3*pi;

nt = 2^6 + 1;
tspan = linspace(0.0, tmax, nt);

y0 = [0, 1]';
[tout, yout] = rk4(fcn, tspan, y0);
size(yout);

tspan6 = linspace(0.0, tmax, 2^6 + 1);
tspan7 = linspace(0.0, tmax, 2^7 + 1);
tspan8 = linspace(0.0, tmax, 2^8 + 1);

[tout6,yout6] = rk4(fcn, tspan6,  y0);
[tout7,yout7] = rk4(fcn, tspan7,  y0);
[tout8,yout8] = rk4(fcn, tspan8,  y0);

yout7_halved = yout7(1:2:end, :);
yout8_quartered = yout8(1:4:end,:);

diff_y7 = (yout7_halved - yout6);
diff_y8 = (yout8_quartered - yout6);


figure;

hold on; 


plot(tout6, diff_y7(:,1),'r');
plot(tout6, diff_y8(:,1),'b');
title('Errors of SHO relative to Level 6');
xlabel('time') ;
ylabel('level to level difference') ;

legend({'level7','level8'},'Location','southwest');


hold off


