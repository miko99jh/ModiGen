model AD_DA_conversion
  Modelica.Electrical.Analog.Ideal.AD_Converter ad_converter(N=7, Rin=1000000, VRefLow=0, VRefHigh=10);
  Modelica.Electrical.Digital.Sources.Pulse pulse(pulse=Modelica.Electrical.Digital.Interfaces.Logic.'1', quiet=Modelica.Electrical.Digital.Interfaces.Logic.'0', nperiod=-1, width=1, period=0.001, startTime=0);
  Modelica.Electrical.Analog.Ideal.DA_Converter da_converter(N=7, Vref=10);
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=5, f=10, offset=5);
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1);
  Modelica.Electrical.Analog.Basic.Ground ground;
equation 
  connect(pulse.y, ad_converter.trig) annotation(Line(color={0,0,127}, smooth=Smooth.None));
  connect(sineVoltage.p, ad_converter.p) annotation(Line(color={0,0,127}, smooth=Smooth.None));
  connect(ad_converter.n, ground.p) annotation(Line(color={0,0,127}, smooth=Smooth.None));
  connect(ad_converter.y, da_converter.x) annotation(Line(color={0,0,127}, smooth=Smooth.None));
  connect(da_converter.p, resistor.p) annotation(Line(color={0,0,127}, smooth=Smooth.None));
  connect(da_converter.n, ground.p) annotation(Line(color={0,0,127}, smooth=Smooth.None));
end AD_DA_conversion;