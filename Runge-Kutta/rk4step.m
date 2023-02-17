% Function that takes in a fourth-order runge-kutta and verifies
% that the local (per step) error incurred by using rk4step is O(∆t^5)

% Inputs
% fcn: Function handle for right hand sides of ODEs (returns
% length-n column vector).
% t0: Initial value of independent variable.
% dt: Time step.
% y0: Initial values (length-n column vector).
%
% Output
% yout: Final values (length-n column vector)

function yout = rk4step(fcn, t0, dt, y0)
    k1 = fcn(t0, y0');
    k2 = fcn( t0 + dt/2, (y0 + dt*k1/2)');
    k3 = fcn(t0 + dt/2, (y0 + dt*k2/2)');
    k4 = fcn(t0+dt, (y0+dt*k3)');
    
    yout = y0 + dt*(k1+ 2*k2 + 2*k3 + k4)/6;

end