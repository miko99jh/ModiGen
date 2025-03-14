model IdealCore "Ideal transformer with 3 windings"
  extends Modelica.Electrical.Machines.BasicMachines.Components.PartialCore;
equation
  im = zeros(m);
  v1 = n12*v2;
  v1 = n13*v3;
end IdealCore;
