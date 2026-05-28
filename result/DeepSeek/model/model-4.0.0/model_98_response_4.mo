function Rt_T
  input Real T "Current temperature";
  output Real Rt "Resistance value";
protected 
  constant Real R0 = 100 "Reference resistance at 0°C";
  constant Real A = 3.9083e-3;
  constant Real B = -5.775e-7;
  constant Real C = -4.183e-12;
algorithm 
  if (T >= 0) and (T < 850) then
    Rt := R0 * (1 + A*T + B*T^2);
  else if (T > -200) and (T < 0) then
    Rt := R0 * (1 + A*T + B*T^2 + C*T^3 * (T - 100));
  else
    Rt := R0;
  end if;
end Rt_T;