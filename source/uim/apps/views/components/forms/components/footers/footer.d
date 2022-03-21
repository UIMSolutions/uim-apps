module uim.apps.views.components.forms.components.footers.footer;

@safe:
import uim.apps;

class DFormFooter : DFormComponent {
  mixin(FormComponentThis!("FormFooter"));

  override void initialize() {
    debugMethodCall(moduleName!DFormFooter~"::DFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(FormComponentCalls!("FormFooter"));

