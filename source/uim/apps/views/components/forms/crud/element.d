module uim.apps.views.components.forms.crud.element;

@safe:
import uim.apps;

class DElementForm : DForm {
  mixin(ViewComponentThis!("ElementForm"));

  mixin(OProperty!("DOOPElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("ElementForm"));
