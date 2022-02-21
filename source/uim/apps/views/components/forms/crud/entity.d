module uim.apps.views.components.forms.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDForm : DAPPEntityForm {
  mixin(APPViewComponentThis!("APPEntityCRUDForm", true));

  override void initialize() {
    super.initialize;

    this
      .body_(
        APPEntityFormBody(this));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityCRUDForm~"::DAPPEntityCRUDForm:beforeH5"); 
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto entitybody_ = cast(DAPPEntityFormBody)this.body_) {
      debug writeln("Found entitybody_");
      entitybody_.entity(this.entity);
    }
  }
}
mixin(APPViewComponentCalls!("APPEntityCRUDForm", true));
