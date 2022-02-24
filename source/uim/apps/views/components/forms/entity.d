module uim.apps.views.components.forms.entity;

@safe:
import uim.apps;

class DAPPEntityForm : DAPPForm, IAPPWithEntity {
  mixin(APPFormThis!("APPEntityForm"));

  protected DOOPEntity _entity;
  DOOPEntity entity() { return _entity; }
  O entity(this O)(DOOPEntity newEntity) {
    _entity = newEntity;

    if (auto entityFormHeader = cast(DAPPEntityFormHeader)this.header) {
      entityFormHeader.entity(this.entity);
    }

    if (auto entityFormBody = cast(DAPPEntityFormBody)this.body_) {
      entityFormBody.entity(this.entity);
    }

    if (auto entityFormFooter = cast(DAPPEntityFormFooter)this.footer) {
      entityFormFooter.entity(this.entity);
    }

    return cast(O)this; }

}
mixin(APPFormCalls!("APPEntityForm"));
