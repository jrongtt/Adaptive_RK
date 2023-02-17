% Takes a single 4th order RK step and compares to analytical solution
% For this example I used the SHO with IC (x(0) = 0, dx/dt(0) = 1)

%fcn = @(t,x1,x2)  [-x2;x1];
fcn = @sho;

y0 = [0, 1]';
t0 = 0;
dt = .1;

rk4_estimate = rk4step(fcn,t0,dt,y0)
sol =  @(t,y) [sin(t)];


sol_y0dt = sol(t0+dt);
rel_error = abs(sol_y0dt - rk4_estimate(1))
O5 = dt^5


