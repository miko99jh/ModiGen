model Test_Convection
  ModelicaByExample.Components.HeatTransfer.Convection conv1(h = 0.7, A =1.0);
  ModelicaByExample.Components.HeatTransfer.ThermalCapacitance cap1(C=0.12, T0 = 363.15);
  ModelicaByExample.Components.HeatTransfer.AmbientCondition amb1(T_amb = 298.15);
equation
  connect(conv1.port_b, cap1.node);
  connect(conv1.port_a, amb1.node);
end Test_Convection;
