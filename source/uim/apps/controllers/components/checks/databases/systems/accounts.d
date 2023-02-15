module uim.apps.controllers.components.checks.databases.systems.accounts;

@safe:
import uim.apps;

class DControllerCheckDatabaseHasAccounts : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasAccounts"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_accounts_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseHasAccounts~":DControllerCheckDatabaseHasAccounts::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_accounts")) { // collection accounts missing 
      this.error("collection_accounts_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasAccounts"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckDatabaseHasAccounts);
    assert(APPCheckDatabaseHasAccounts);
    assert(new DControllerCheckDatabaseHasAccounts(Controller));
    assert(APPCheckDatabaseHasAccounts(Controller));
  }
}