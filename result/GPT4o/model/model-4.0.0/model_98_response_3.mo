function Rt_T
 input Real T; // Input temperature in degrees Celsius
  output Real Rt; // Output resistance in ohms
protected
  constant Real R0 = 100; // Reference resistance at 0°C in ohms
  constant Real A = 3.9083e-3; // Coefficient A
  constant Real B = -5.775e-7; // Coefficient B
  constant Real C = -4.183e-12; // Coefficient C
algorithm
  if T >= 0 and T < 850 then
    Rt := R0 * (1 + A*T + B*T^2);
  elseif T > -200 and T < 0 then
    Rt := R0 * (1 + A*T + B*T^2 + C*T^3 * (T - 100));
  else
    // Handle out of range temperature
    Rt := R0; // Default or error handling, can be adjusted as needed
  end if;
end Rt_T;