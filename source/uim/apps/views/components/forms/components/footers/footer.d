module uim.apps.views.components.forms.components.footers.footer;

@safe:
import uim.apps;

class DFormFooter : DFormComponent {
  mixin(ViewComponentThis!("FormFooter"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DFormFooter~"::DFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(ViewComponentCalls!("FormFooter"));

version(test_uim_apps) { unittest {
  assert(FormFooter);
}}