module uim.apps.views.components.lists.item;

@safe:
import uim.apps;

class DAPPListItemComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPListItemComponent"));

  mixin(OProperty!("string", "rootPath"));
}
mixin(APPViewComponentCalls!("APPListItemComponent"));
