% Function that takes a system of ODEs and computs a single fourth-order
% Runge Kutte step

% Inputs
% fcn: Function handle for right hand sides of ODEs (returns
% length-n column vector)
% tspan: Vector of output times (length nout).
% y0: Initial values (length-n column vector).
%
% Outputs
% tout: Vector of output times.
% yout: Output values (nout x n array. The ith column of yout
% contains the nout values of the ith dependent variable).


function [tout yout] = rk4(fcn, tspan, y0)
    
    yout = zeros(length(tspan), length(y0));
    yout(1,:) = y0;

    for i = 2:length(tspan)    
        dt = tspan(i)-tspan(i-1);
        yout(i,:) = rk4step(fcn, tspan(i), dt, yout(i-1,:)');
    end
    tout = tspan;


end