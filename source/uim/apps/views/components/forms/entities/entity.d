module uim.apps.views.components.forms.entities.entity;

@safe:
import uim.apps;

class DAPPEntityForm : DAPPForm, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityForm", true));

  override void initialize() {
    super.initialize;

    this
      .formBody(
        APPEntityFormBody(this));
  }

  mixin(OProperty!("DOOPEntity", "entity"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityForm~"::DAPPEntityForm:beforeH5"); 
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto entityFormBody = cast(DAPPEntityFormBody)this.formBody) {
      debug writeln("Found entityFormBody");
      entityFormBody.entity(this.entity);
    }
  }
}
mixin(APPViewComponentCalls!("APPEntityForm", true));
