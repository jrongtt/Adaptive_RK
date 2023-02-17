% Function defining the Van der Pol Oscillator System of ODE

function dydt = vdp1(t,x)

dydt = [x(2); 5*(1-x(1)^2)*x(2)-x(1)];