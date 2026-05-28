block Impedance extends Modelica.Blocks.Icons.Block;
  import Modelica.Constants;
  import Modelica.ComplexMath;
  import Modelica.Electrical.Batteries.ParameterRecords.TransientData.CellData;
  import Modelica.Blocks.Interfaces;
  import Modelica.ComplexBlocks.Interfaces;

  parameter CellData cellData;
  RealInput f(unit="Hz") = 0;
  ComplexOutput z(re=Modelica.Blocks.Interfaces.RealOutput(unit="Ohm"), im=Modelica.Blocks.Interfaces.RealOutput(unit="Ohm")) = Complex(cellData.R0, 0) + sum({1/Complex(1/cellData.rcData[k].R, 2*pi*f*cellData.rcData[k].C) for k in 1:cellData.nRC});
end Impedance;