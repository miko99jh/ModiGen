**Exemplary Test Case Prompt:**  
  
**Modelica model:**  
within IndustrialControlSystems.LinearSystems.Continuous;  
model LeadLag "Lead lag process: mu(1+T1\*s)/(1+T2\*s)"  
&ensp;extends Interfaces.BaseBlock;  
&ensp;parameter Real T1 = 3 "|Block parameters| zero's time constant";  
&ensp;parameter Real T2 = 5 "|Block parameters| pole's time constant";  
&ensp;parameter Real mu = 1 "|Block parameters| Gain";  
&ensp;parameter Real y\_start = 0 "|Initial conditions| output initial value";  
&ensp;Real dy;  
protected  
&ensp;parameter Real A = T1/T2;  
&ensp;parameter Real B = 1 - A;  
initial equation  
&ensp;dy = y\_start;  
equation  
&ensp;assert(abs(A-1)>1e-8,"T1 must be != T2");  
&ensp;dy + T2\*der(dy) = mu\*B\*u;  
&ensp;y = u\*mu\*A + dy;  
end LeadLag;  

**Model description:**  
Continuous time transfer function of a lead lag process.  
&emsp;Y(s)/U(s) = mu*(1 + s\*T1)/(1 + s\*T2)  
The time constant T1 must be different from T2.  

**Prompt:**  
Use this model to solve the transfer function of the lead lag process, where the zero's time constant 'T1' of the lead lag process is 2, pole's time constant 'T2' is 3, the gain 'mu' is 2, and the initial conditions 'y_start' is 0.  
The input signal 'stepSignal' is implemented by Modelica.Blocks.Sources.Step, stepSignal is set to height=2, startTime=10.  
The connection of the signal is based on 'connect'. Please help me generate this modelica model, you don't need to provide "within".
