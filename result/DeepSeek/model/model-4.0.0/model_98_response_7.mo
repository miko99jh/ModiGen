function Rt_T(Real T)
  input Real T "Current temperature";
  output Real Rt "Resistance value";
protected 
  Real R0 = 100 "Reference resistance at 0°C";
  Real A = 3.9083e-3 "Coefficient";
  Real B = -5.775e-7 "Coefficient";
  Real C = -4.183e-12 "Coefficient";
algorithm 
  if (T >= 0) and (T < 850) then
    Rt := R0 * (1 + A*T + B*T^2);
  else
    if (T > -200) and (T < 0) then
      Rt := R0 * (1 + A*T + B*T^2 + C*T^3 * (T - 100));
    else
      Rt := R0;
    end if;
  end if;
end Rt_T;