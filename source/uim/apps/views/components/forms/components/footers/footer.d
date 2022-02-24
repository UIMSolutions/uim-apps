module uim.apps.views.components.forms.components.footers.footer;

@safe:
import uim.apps;

class DAPPFormFooter : DAPPFormComponent {
  mixin(APPFormComponentThis!("APPFormFooter"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPFormFooter~"::DAPPFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(APPFormComponentCalls!("APPFormFooter"));

