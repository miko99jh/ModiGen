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
    // Calculate resistance for temperatures between 0°C and 850°C
    Rt := R0 * (1 + A*T + B*T^2);
  elseif T > -200 and T < 0 then
    // Calculate resistance for temperatures between -200°C and 0°C
    Rt := R0 * (1 + A*T + B*T^2 + C*T^3 * (T - 100));
  else
    // Handle temperatures outside the specified range
    // You can choose to raise an error or handle it as needed
    Rt := 0; // Default or error value
  end if;
end Rt_T;