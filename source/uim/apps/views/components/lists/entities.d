module uim.apps.views.components.lists.entities;

@safe:
import uim.apps;

class DAPPEntitiesList : DAPPListViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesList"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
 
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto listGroup = BS5ListGroup(["list-group-flush", "list-group-hoverable"]);
    if (auto entityListItem = cast(DEntityListItem)itemTemplate) {
      foreach(entity; this.entities) {
        listGroup.item(entityListItem.entity(entity).toH5(options));
    }}
    this.content(StaticViewComponent.h5([listGroup].toH5));
  }
}
mixin(ViewComponentCalls!("APPEntitiesList"));