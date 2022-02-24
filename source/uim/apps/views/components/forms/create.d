module uim.apps.views.components.forms.create;

@safe:
import uim.apps;

class DAPPCreateEntityForm : DAPPEntityForm {
  mixin(APPFormThis!("APPCreateEntityForm"));
}
mixin(APPFormCalls!("APPCreateEntityForm"));
