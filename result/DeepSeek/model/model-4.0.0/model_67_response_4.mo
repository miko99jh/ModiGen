model IdealCore
  extends Modelica.Electrical.Machines.Core.PartialCore;
  parameter Integer n12(start=1) "Voltage transformation ratio 1 to 2";
  parameter Integer n13(start=1) "Voltage transformation ratio 1 to 3";
  parameter Integer m(start=1) "Number of phases";
  parameter Real v1(start=1) "Primary voltage";
  parameter Real v2(start=1) "Secondary voltage";
  parameter Real v3(start=1) "Tertiary voltage";
  Real im[m](start=zeros(m)) "Magnetizing current";
equation 
  im = zeros(m);
  v1 = n12 * v2;
  v1 = n13 * v3;
end IdealCore;