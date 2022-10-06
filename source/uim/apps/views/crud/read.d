module uim.apps.views.crud.read;

@safe:
import uim.apps;

class DAPPEntityReadView : DAPPEntityCRUDAPPView { // Default view
  mixin(ViewThis!("APPEntityReadView"));
}
mixin(ViewCalls!("APPEntityReadView"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityReadView); 
}}