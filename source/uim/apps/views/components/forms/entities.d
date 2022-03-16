module uim.apps.views.components.forms.entities;

@safe:
import uim.apps;

class DAPPEntitiesForm : DAPPForm, IAPPWithEntities {
  mixin(APPFormThis!("APPEntitiesForm"));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return null; }

    debug writeln("Found entities: %s".format(entities.length));
    foreach(formComponent; this.components) { 
      if (auto entitiesComponent = cast(DEntitiesViewComponent)formComponent) {
        entitiesComponent.entities(this.entities); 
      }
    } 
/*     if (auto entitiesHeader = cast(DEntitiesFormHeader)this.header) {
      entitiesHeader.entities(this.entities); 
    }
    if (auto entitiesContent = cast(DEntitiesFormContent)this.content) {
      entitiesContent.entities(this.entities); 
    }
    if (auto entitiesFooter = cast(DEntitiesFormFooter)this.footer) {
      entitiesFooter.entities(this.entities); 
    } */

    return null;
  }
}
mixin(APPFormCalls!("APPEntitiesForm"));
