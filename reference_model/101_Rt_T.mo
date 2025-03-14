function Rt_T "Pt100 resistance Temperature characteristic function"
  input Real T;
  output Real Rt;
  protected Modelica.Units.SI.Resistance R0=100;
  protected Real A=3.9083*10^(-3),B=-5.775*10^(-7),C=-4.183*10^(-12);
algorithm
  if (T>=0) and (T<850) then
    Rt:=R0*(1+A*T+B*T^2);
  elseif (T>-200) and (T<0) then
    Rt:=R0*(1+A*T+B*T^2+C*T^3*(T-100));
  end if;
end Rt_T;
