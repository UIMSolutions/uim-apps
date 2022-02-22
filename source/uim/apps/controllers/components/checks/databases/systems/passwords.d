module uim.apps.controllers.components.checks.databases.systems.passwords;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasPasswords : DAPPCheckDatabaseHasSystems {
  mixin(APPControllerComponentThis!("APPCheckDatabaseHasPasswords"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_passwords_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasPasswords~":DAPPCheckDatabaseHasPasswords::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_passwords")) { // collection passwords missing 
      this.error("collection_passwords_missing");
      return false; 
    }
    
    return true;
  }
}
mixin(APPControllerComponentCalls!("APPCheckDatabaseHasPasswords"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCheckDatabaseHasPasswords);
    assert(APPCheckDatabaseHasPasswords);
    assert(new DAPPCheckDatabaseHasPasswords(APPController));
    assert(APPCheckDatabaseHasPasswords(APPController));
  }
}