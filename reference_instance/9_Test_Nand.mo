model Test_Nand1
  IndustrialControlSystems.Logical.LogicalOperations.Nand Nand(Ts=0.1);
  Boolean[2] u1 = {false,true};
  Boolean y[1];
equation
  Nand.u[1] = u1[1];
  Nand.u[2] = u1[2];
  y = Nand.y;
end Test_Nand1;
