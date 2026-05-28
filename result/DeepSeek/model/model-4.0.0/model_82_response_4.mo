function factorY2DC
  extends Modelica.Icons.Function;
  input Integer m=3 "Number of phases";
  output Real y "Factor of DC-voltage from RMS Y-voltage";
protected 
  Integer mBasic=integer(m/Modelica.Electrical.Polyphase.Functions.numberOfSymmetricBaseSystems(m)) "Basic number of phase systems";
algorithm 
  if mBasic == 2 then
    y := 4/Modelica.Constants.pi;
  else 
    y := 2*sin((mBasic - 1)/2*Modelica.Constants.pi/mBasic)*sqrt(2)*sin(Modelica.Constants.pi/(2*m))/(Modelica.Constants.pi/(2*m));
  end if;
end factorY2DC;