module uim.apps.views.components.forms.entity;

@safe:
import uim.apps;

class DEntityForm : DForm {
  mixin(FormThis!("EntityForm"));
}
mixin(FormCalls!("EntityForm"));
