module uim.apps.mixins.imports;

template ImportAppPackages(string rootName) {
  const char[] ImportAppPackages = "
public {
  import "~rootName~".controllers;
  import "~rootName~".helpers;
  import "~rootName~".routers;
  import "~rootName~".tests;
  import "~rootName~".views;
}
  ";
}