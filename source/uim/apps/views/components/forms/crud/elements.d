module uim.apps.views.components.forms.crud.elements;

@safe:
import uim.apps;

class DElementsForm : DForm {
  mixin(ViewComponentThis!("ElementsForm"));

  mixin(OProperty!("DOOPElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("ElementsForm"));
