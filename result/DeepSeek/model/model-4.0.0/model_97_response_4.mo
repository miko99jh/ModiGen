model RTD_Pt100
  parameter Real V = 1.15e-9 "Volume of the sensor";
  parameter Real c = 456 "Comprehensive specific heat";
  parameter Real Ar = 5.31e-6 "Sensor surface area";
  parameter Real alpha = 800 "Convective heat transfer coefficient";
  parameter Real pho = 7980 "Comprehensive density";
  Real Tj(start = 25) "Sensor temperature";
  Real Tg "Medium temperature";
equation
  der(Tj) = (alpha * Ar * (Tg - Tj) + c * V * pho * (Tg - Tj)) / (c * V * pho + alpha * Ar);
end RTD_Pt100;