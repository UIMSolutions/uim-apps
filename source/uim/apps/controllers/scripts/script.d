module uim.apps.controllers.scripts.script;

@safe:
import uim.apps;

class DAPPScript : DController {
  this() { initialize; }
  this(DAPPApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
  override void initialize() {
    super.initialize;

    this.name = "APPScript"; 
    this.mimetype("text/css");
  }
} 
auto APPScript() { return new DAPPScript; }
auto APPScript(DAPPApplication myApp) { return new DAPPScript(myApp); }