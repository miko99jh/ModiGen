function factorY2DC
  extends Modelica.Icons.Function;
  input Integer m=3 "Number of phases";
  output Real y "Factor of DC-voltage from RMS Y-voltage";
protected 
  Integer mBasic=integer(m/Modelica.Electrical.Polyphase.Functions.numberOfSymmetricBaseSystems(m)) "Number of basic systems";
algorithm 
  if mBasic == 2 then
    y := 4/Modelica.Constants.pi;
  else 
    y := 2*Modelica.Math.sin((mBasic - 1)/2*Modelica.Constants.pi/mBasic)*Modelica.Math.sqrt(2)*Modelica.Math.sin(Modelica.Constants.pi/(2*m))/Modelica.Constants.pi/(2*m);
  end if;
end factorY2DC;