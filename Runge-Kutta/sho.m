% Function defining the Simple Harmonic Oscillator System of ODE

function dydt = sho(t,x)

dydt = [x(2); -x(1)];