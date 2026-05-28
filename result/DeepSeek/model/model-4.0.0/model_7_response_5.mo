model RelayHysteresis
 "Relay with hysteresis functionality"
    extends Controllers.Interfaces.BaseBlock(
      parameter Real Ymax = 1,
      parameter Real Ymin = 0,
      parameter Real ThL = 0,
      parameter Real ThH = 0,
      parameter Boolean initState = false
    );
    // Model equations go here
  end RelayHysteresis;