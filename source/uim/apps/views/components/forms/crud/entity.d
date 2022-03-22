module uim.apps.views.components.forms.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDForm : DForm {
  mixin(ViewComponentThis!("APPEntityCRUDForm", true));

  override void initialize() {
    super.initialize;

    this.components["content"] = FormContent(this);
  }
}
mixin(ViewComponentCalls!("APPEntityCRUDForm", true));
