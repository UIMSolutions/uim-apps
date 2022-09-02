module uim.apps.views.components.lists.entities;

@safe:
import uim.apps;

class DAPPEntitiesList : DAPPListViewComponent {
  mixin(ViewComponentThis!("APPEntitiesList"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln ("%s Entities in DAPPEntitiesList".format(this.entities.length));

    auto listGroup = BS5ListGroup(["list-group-flush", "list-group-hoverable"]);
    if (auto myListItem = cast(DEntityListItem)itemTemplate) {
      foreach(entity; this.entities) {
        listGroup.item(myListItem.entity(entity).toH5(options));
    }}
    this.listContent(StaticViewComponent.h5([listGroup].toH5));
  }
}
mixin(ViewComponentCalls!("APPEntitiesList"));

version(test_uim_apps) { unittest {
  assert(APPEntitiesList);
}}