module uim.apps.controllers.components.checks.databases.systems.accounts;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasAccounts : DAPPCheckDatabaseHasSystems {
  mixin(APPControllerComponentThis!("APPCheckDatabaseHasAccounts"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_accounts_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasAccounts~":DAPPCheckDatabaseHasAccounts::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_accounts")) { // collection accounts missing 
      this.error("collection_accounts_missing");
      return false; }
    
    return true;
  }
}
mixin(APPControllerComponentCalls!("APPCheckDatabaseHasAccounts"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCheckDatabaseHasAccounts);
    assert(APPCheckDatabaseHasAccounts);
    assert(new DAPPCheckDatabaseHasAccounts(APPController));
    assert(APPCheckDatabaseHasAccounts(APPController));
  }
}