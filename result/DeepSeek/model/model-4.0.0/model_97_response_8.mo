model RTD_Pt100
  parameter Real V = 1.15*10^(-9);
  parameter Real c = 456;
  parameter Real Ar = 5.31*10^(-6);
  parameter Real alpha = 800;
  parameter Real pho = 7980;
  Real Tj(start=25);
  input Real Tg;
equation
  der(Tj) = (Ar*(Tg-Tj)*alpha - V*c*pho*der(Tj))/V/c/pho;
end RTD_Pt100;