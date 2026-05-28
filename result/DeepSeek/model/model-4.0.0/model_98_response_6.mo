function Rt_T
  input Real T "Temperature";
  output Real Rt "Resistance at temperature T";
protected 
  constant Real R0 = 100 "Reference resistance at 0 degree Celsius";
  constant Real A = 3.9083*10^(-3) "Coefficient A";
  constant Real B = -5.775*10^(-7) "Coefficient B";
  constant Real C = -4.183*10^(-12) "Coefficient C";
algorithm 
  if (T >= 0) and (T < 850) then
    Rt := R0 * (1 + A*T + B*T^2);
  elseif (T > -200) and (T < 0) then
    Rt := R0 * (1 + A*T + B*T^2 + C*T^3 * (T - 100));
  else
    Rt := R0;
  end if;
end Rt_T;