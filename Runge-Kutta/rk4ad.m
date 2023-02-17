% Inputs
% fcn: Function handle for right hand sides of ODEs (returns
% length-n column vector)
% tspan: Vector of output times (length nout vector).
% reltol: Relative tolerance parameter.
% y0: Initial values (length-n column vector).
%
% Outputs
% tout: Output times (length-nout column vector, elements
% identical to tspan).
% yout: Output values (nout x n array. The ith column of yout
% contains the nout values of the ith dependent variable).

% Calculates adaptive Runge-Kutta
function [tout yout] = rk4ad(fcn, tspan, reltol, y0)


    yout = zeros(length(tspan), length(y0));
    yout(1, :) = y0;
   
    
       
         for i = 1:length(tspan)-1

            dt = tspan(i+1)-tspan(i);
            t0 = tspan(i);
            y0 = yout(i, :)';
            
            yout_C = rk4step(fcn, t0, dt, y0);
            yout_F_1 = rk4step(fcn, t0, dt/2, y0);
            yout_F = rk4step(fcn, t0+dt/2, dt/2, yout_F_1);
            err = 16*(abs(yout_C- yout_F)/(yout_F))/15;
           

             % Here before we go on to next while loop we want to divide
             % the tspan(i+1) - tspan(i) by dt and do rk4steps until you
             % have a y0 at tspan(i+1)

            yout_last_C = y0;

            if (err(1) > reltol)
                tcurr = tspan(i);

                while (abs(tcurr - tspan(i +1)) > 10^(-6))

                    if (err(1) > reltol && dt/2 > 10^(-4))
                        dt = dt/2;
                    end
                    

                    yout_C = rk4step(fcn, tcurr, dt, yout_last_C);
                    yout_F_1 = rk4step(fcn, tcurr, dt/2, yout_last_C);
                    yout_F = rk4step(fcn, tcurr+dt/2, dt/2, yout_F_1);

                    err = 16*(abs(yout_C- yout_F)/(yout_F))/15;
                    tcurr = tcurr + dt;
                    yout_last_C = yout_C;
                end

                yout(i+1, :) = yout_C;

            else
                yout(i+1, :) = yout_C;
      
            end
           
            


        
         end
         tout = tspan;
end
    
    
    
    

    

