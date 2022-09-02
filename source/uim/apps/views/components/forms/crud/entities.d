module uim.apps.views.components.forms.crud.entities;

@safe:
import uim.apps;

class DEntitiesForm : DForm {
  mixin(ViewComponentThis!("EntitiesForm"));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("EntitiesForm"));
