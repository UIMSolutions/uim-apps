module uim.apps.views.components.forms.components.contents.table;

@safe:
import uim.apps;

class DAPPTableFormContent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("APPTableFormContent"));

  mixin(OProperty!("DAPPViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPTableFormContent~"::DAPPTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(ViewComponentCalls!("APPTableFormContent"));

version(test_uim_apps) { unittest {
  assert(APPTableFormContent);
}}