block Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1=Complex(1, 0) "Gain factor for input 1";
  parameter Modelica.ComplexBlocks.Types.Complex k2=Complex(1, 0) "Gain factor for input 2";
  Modelica.ComplexBlocks.Interfaces.ComplexInput u1(quantity="input", unit="") 
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.ComplexBlocks.Interfaces.ComplexInput u2(quantity="input", unit="") 
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.ComplexBlocks.Interfaces.ComplexOutput y(quantity="output", unit="") 
    annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
equation 
  y = k1*u1 + k2*u2;
end Add;