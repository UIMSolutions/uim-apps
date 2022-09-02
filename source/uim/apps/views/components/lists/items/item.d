module uim.apps.views.components.lists.items.item;

@safe:
import uim.apps;

class DListItem : DEntityViewComponent {
  mixin(ViewComponentThis!("ListItem"));
}
mixin(ViewComponentCalls!("ListItem"));
