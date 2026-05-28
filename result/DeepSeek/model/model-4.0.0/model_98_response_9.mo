model PlatinumResistor
 parameter Real R0 = 100 "Reference resistance at 0°C";
  parameter Real A = 3.9083*10^(-3) "Constant";
  parameter Real B = -5.775*10^(-7) "Constant";
  parameter Real C = -4.183*10^(-12) "Constant";
  Real T "Current temperature";
  Real Rt "Resistance value";
equation 
  Rt = Rt_T(T);
end PlatinumResistor;