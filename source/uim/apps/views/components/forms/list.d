module uim.apps.views.components.forms.list;

@safe:
import uim.apps;

class DAPPListForm : DAPPForm {
  this() { super();
    this
    .formHeader(null)
    .formBody(APPListFormBody);
  }
  this(DAPPView myView) { this().view(myView); }

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
auto APPListForm() { return new DAPPListForm; }
auto APPListForm(DAPPView myView) { return new DAPPListForm(myView); }
