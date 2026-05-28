model MyModel
 // Other components of the model
  Real sphereRadius = 5 "Radius of the sphere";
  Real sphereSurface;
  Real sphereVolume;
equation
  // Call the function
  SphereProperties(radius=sphereRadius, surface=sphereSurface, volume=sphereVolume);
  // Other equations
end MyModel;