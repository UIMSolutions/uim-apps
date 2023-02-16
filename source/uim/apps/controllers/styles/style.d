module uim.apps.controllers.styles.style;

@safe:
import uim.apps;

class DAPPStyle : DController {
  this() { initialize; }
  this(DAPPApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this.name = "APPStyle"; 
    this.mimetype("application/javastyle"); 
  }
} 
auto APPStyle() { return new DAPPStyle; }
auto APPStyle(DAPPApplication myApp) { return new DAPPStyle(myApp); }