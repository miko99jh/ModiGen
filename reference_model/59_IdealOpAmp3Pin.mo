model IdealOpAmp3Pin
  "Ideal operational amplifier (norator-nullator pair), but 3 pins"
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p "Positive pin of the input port";
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n "Negative pin of the input port";
  Modelica.Electrical.Analog.Interfaces.PositivePin out "Output pin";
equation
  in_p.v = in_n.v;
  in_p.i = 0;
  in_n.i = 0;
end IdealOpAmp3Pin;
