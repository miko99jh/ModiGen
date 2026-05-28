block Impedance extends Modelica.Blocks.Icons.Block
  import Modelica.Constants;
  import Modelica.ComplexMath;
  import Modelica.Electrical.Batteries.ParameterRecords.TransientData.CellData;
  import Modelica.Blocks.Interfaces;
  import Modelica.ComplexBlocks.Interfaces;

  parameter CellData cellData;
  RealInput f(unit = "Hz");
  ComplexOutput z(redeclare package Modelica.ComplexBlocks.Interfaces.ComplexOutput(redeclare RealOutput re(unit = "Ohm"), redeclare RealOutput im(unit = "Ohm")));

  equation
    z.re = cellData.R0 + sum({1/(1/cellData.rcData[k].R + 2*pi*f*cellData.rcData[k].C) for k in 1:cellData.nRC});
    z.im = 0;
end Impedance;