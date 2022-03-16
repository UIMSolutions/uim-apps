module uim.apps.views.components.forms.components.footers.entity;

@safe:
import uim.apps;

class DEntityFormFooter : DFormFooter, IAPPWithEntity {
  mixin(APPFormComponentThis!("EntityFormFooter", true));

  protected DOOPEntity _entity;
  DOOPEntity entity() { return _entity; }
  bool hasEntity() {
    return (this.entity !is null); 
  }

  O entity(this O)(DOOPEntity newEntity) { 
    _entity = newEntity;

    if (auto entityContent = cast(DEntityFormContent)this.content) {
      entityContent.entity(this.entity); 
    }

    return cast(O)this;
  }
}
mixin(APPFormComponentCalls!("EntityFormFooter", true));

