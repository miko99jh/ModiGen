model Test_PatientController1
  MEV.Controls.PatientController patientController;
  Modelica.Blocks.Sources.TimeTable RR(table = [0, 30; 48, 30; 48, 20; 79, 20; 79, 0; 100, 0]);
  Modelica.Blocks.Sources.TimeTable dutyCycle(table = [0, 50; 20, 50; 50, 25; 100, 25]);
equation
  connect(RR.y, patientController.RR);
  connect(dutyCycle.y, patientController.dutyCycle);
end Test_PatientController1;
