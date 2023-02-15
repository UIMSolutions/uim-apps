module uim.apps.controllers.components.checks.databases.systems.passwords;

@safe:
import uim.apps;

class DControllerCheckDatabaseHasPasswords : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasPasswords"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_passwords_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseHasPasswords~":DControllerCheckDatabaseHasPasswords::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_passwords")) { // collection passwords missing 
      this.error("collection_passwords_missing");
      return false; 
    }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasPasswords"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckDatabaseHasPasswords);
    assert(APPCheckDatabaseHasPasswords);
    assert(new DControllerCheckDatabaseHasPasswords(Controller));
    assert(APPCheckDatabaseHasPasswords(Controller));
  }
}