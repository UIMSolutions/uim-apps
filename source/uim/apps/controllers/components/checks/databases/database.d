module uim.apps.controllers.components.checks.databases.database;

@safe:
import uim.apps;

class DControllerCheckDatabaseExists : DControllerCheck {
  mixin(ControllerComponentThis!("APPCheckDatabaseExists"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=database_missing");
  }
  
  // Secure shortcut to this.database
  auto database() {
    return this.controller ? this.controller.database : null;
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseExists~":DControllerCheckDatabaseExists::execute");
    if (!super.execute(options)) { return false; }

    if (!this.controller) debug writeln("Controller missing");
        
    if (!this.database) { // database missing 
      this.error("database_missing");
      return false;
    }
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseExists"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    // TODO
  }
}