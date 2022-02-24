module uim.apps.views.components.forms.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDForm : DAPPEntityForm {
  mixin(APPViewComponentThis!("APPEntityCRUDForm", true));

  override void initialize() {
    super.initialize;

    this
      .body_(
        APPEntityFormBody(this));
  }

/*   override void _afterSetEntity() {
    super._afterSetEntity;

    if (auto formBody = cast(DAPPEntityFormBody)this.body_) {
      debug writeln("Found formBody");
      formBody.entity(this.entity);
    } 
  } */
}
mixin(APPViewComponentCalls!("APPEntityCRUDForm", true));
