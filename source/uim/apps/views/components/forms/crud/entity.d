module uim.apps.views.components.forms.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDForm : DEntityForm {
  mixin(ViewComponentThis!("APPEntityCRUDForm", true));

  override void initialize() {
    super.initialize;

    this.components["content"] = EntityFormContent(this);
  }
}
mixin(ViewComponentCalls!("APPEntityCRUDForm", true));
