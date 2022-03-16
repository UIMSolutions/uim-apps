module uim.apps.views.components.tables.entities;

@safe:
import uim.apps;

class DAPPEntitiesTableViewComponent : DAPPTableViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesTableViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     if (auto entitiesHeader = cast(IAPPWithEntities)this.header) {
      entitiesHeader.entities(this.entities);
    }  */
  }
} 
mixin(ViewComponentCalls!("APPEntitiesTableViewComponent"));
