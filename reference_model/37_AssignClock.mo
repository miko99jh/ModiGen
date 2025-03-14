block AssignClock1 "Assign a clock to a clocked Integer signal"
  Modelica.Blocks.Interfaces.IntegerInput u
    "Connector of clocked, Integer input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.IntegerOutput y
    "Connector of clocked, Integer output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
   Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
equation
  when clock then
    y = u;
  end when;
end AssignClock1;
