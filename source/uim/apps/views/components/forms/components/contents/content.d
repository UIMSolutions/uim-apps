module uim.apps.views.components.forms.components.contents.content;

@safe:
import uim.apps;

class DFormContent : DFormComponent {
  mixin(ViewComponentThis!("FormContent"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DFormContent~"::DFormContent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(ViewComponentCalls!("FormContent"));

version(test_uim_apps) { unittest {
  assert(FormContent);
}}