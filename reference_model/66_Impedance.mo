block Impedance1 "Calculate complex impedance"
  extends Modelica.Blocks.Icons.Block;
  import Modelica.Constants.pi;
  parameter Modelica.Electrical.Batteries.ParameterRecords.TransientData.CellData cellData "Transient cell data";
  Modelica.Blocks.Interfaces.RealInput f(unit="Hz") "Frequency"
 ;
  Modelica.ComplexBlocks.Interfaces.ComplexOutput z(re(unit="Ohm"), im(unit="Ohm")) "Complex impedance"
 ;
equation
  z = Complex(cellData.R0, 0) + sum({1/Complex(1/cellData.rcData[k].R, 2*pi*f*cellData.rcData[k].C) for k in 1:cellData.nRC})  ;
end Impedance1;
