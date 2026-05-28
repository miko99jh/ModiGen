block Add
  extends Modelica.ComplexBlocks.Interfaces.ComplexSI2SO;
  parameter Modelica.ComplexBlocks.Types.Complex k1=Complex(1, 0) "Gain factor for u1";
  parameter Modelica.ComplexBlocks.Types.Complex k2=Complex(1, 0) "Gain factor for u2";
  Modelica.ComplexBlocks.Interfaces.ComplexInput u1(quantity="Flow") annotation(
    Dialog(group="Input"));
  Modelica.ComplexBlocks.Interfaces.ComplexInput u2(quantity="Flow") annotation(
    Dialog(group="Input"));
  Modelica.ComplexBlocks.Interfaces.ComplexOutput y(quantity="Flow") annotation(
    Dialog(group="Output"));
equation 
  y = k1 * u1 + k2 * u2;
end Add;