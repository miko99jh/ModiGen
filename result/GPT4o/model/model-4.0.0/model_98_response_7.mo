function Rt_T
 input Real T; // Temperature in degrees Celsius
  output Real Rt; // Resistance in ohms

protected
  parameter Real R0 = 100; // Reference resistance at 0°C in ohms
  parameter Real A = 3.9083e-3; // Coefficient A
  parameter Real B = -5.775e-7; // Coefficient B
  parameter Real C = -4.183e-12; // Coefficient C

algorithm
  if T >= 0 and T < 850 then
    Rt := R0 * (1 + A*T + B*T^2);
  elseif T > -200 and T < 0 then
    Rt := R0 * (1 + A*T + B*T^2 + C*T^3 * (T - 100));
  else
    // Handle out of range temperature
    // You can choose to set Rt to a default value or raise an error
    Rt := R0; // Default to R0 if out of range
  end if;
end Rt_T;