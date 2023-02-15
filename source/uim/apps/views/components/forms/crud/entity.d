module uim.apps.views.components.forms.crud.entity;

@safe:
import uim.apps;

class DEntityForm : DForm {
  mixin(ViewComponentThis!("EntityForm"));

  mixin(OProperty!("DEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("EntityForm"));
