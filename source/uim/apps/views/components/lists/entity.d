module uim.apps.views.components.lists.entity;

@safe:
import uim.apps;

class DAPPListEntityComponent : DAPPListItemComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPListEntityComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
  O opCall(this O)(DOOPEntity newEntity) { this.entity(newEntity); }

  mixin(OProperty!("string", "icon"));

  override void initialize() {
    super.initialize;

    this
      .icon(tablerIcon("chevron-right"));
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    
    auto link = this.rootPath~this.entity.name;

    return [
      BS5Row(["align-items-center"],
        BS5Col(["col"], 
          H5A(["href":link], H5H3(this.entity.display))),
        BS5Col(["col-auto"], 
          H5A(["list-group-item-actions show"], ["href":link], this.icon)))
    ].toH5;
  }
}
mixin(APPViewComponentCalls!("APPListEntityComponent"));
