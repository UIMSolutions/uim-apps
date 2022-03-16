module uim.apps.views.components.lists.list;

@safe:
import uim.apps;

class DAPPListViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPListViewComponent"));

  mixin(SProperty!("DH5Obj", "noEntities"));
  mixin(SProperty!("DOOPEntity[UUID]", "themesById"));

  mixin(OProperty!("DListItem", "itemTemplate"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return null; }

    auto card = BS5Card;
    if (showHeader) card.header(["d-block"]~headerClasses, this.header.toH5(options));
    card.body_(contentClasses, this.content.toH5(options));
    if (showFooter) card.footer(["d-block"]~footerClasses, this.footer.toH5(options));

    return [card].toH5;
  }
}
mixin(ViewComponentCalls!("APPListViewComponent"));
