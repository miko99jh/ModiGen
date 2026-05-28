function factorY2DC
 extends Modelica.Icons.Function;
  import Modelica.Constants.pi;
  import Modelica.Electrical.Polyphase.Functions.numberOfSymmetricBaseSystems;

  input Integer m = 3 "Number of phases";
  output Real y "Factor of DC-voltage from RMS Y-voltage";

protected 
  Integer mBasic = integer(m / numberOfSymmetricBaseSystems(m));

algorithm 
  if mBasic == 2 then
    // Standard full-wave bridge rectification ratio
    y := 4 / pi;
  else
    // General polyphase geometric relationship
    y := 2 * sin((mBasic - 1) / 2 * pi / mBasic) * sqrt(2) * sin(pi / (2 * m)) / (pi / (2 * m));
  end if;
end factorY2DC;