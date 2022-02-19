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
        BS5Col(["col-auto"], 
          H5Span(["badge bg-red"])),
        BS5Col(["col-auto"], 
          H5A(["href":link], H5H3(this.entity.name))),
        BS5Col(["col", "text-truncate"],
          H5A(["text-body d-block"], ["href":link], this.entity["mainTitle"]), 
          H5Small(["d-block", "text-muted", "text-truncate", "mt-n1"], this.entity["subTitle"]),
        BS5Col(["col-auto"], 
          H5A(["list-group-item-actions show"], ["href":link], this.icon))))].toH5;
  }
}
mixin(APPViewComponentCalls!("APPListEntityComponent"));
