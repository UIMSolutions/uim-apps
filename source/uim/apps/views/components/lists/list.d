module uim.apps.views.components.lists.list;

@safe:
import uim.apps;

class DAPPListViewComponent : DAPPViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPListViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
  mixin(SProperty!("DH5Obj", "noEntities"));
  mixin(SProperty!("DOOPEntity[UUID]", "themesById"));

  mixin(OProperty!("DH5Obj[]", "header"));
  mixin(OProperty!("DH5Obj[]", "content"));
  mixin(OProperty!("DH5Obj[]", "footer"));  

  mixin(OProperty!("DAPPListEntityComponent", "itemTemplate"));

  override void initialize() {
    super.initialize;

    this
      .content([
        BS5ListGroup(["list-group-flush", "list-group-hoverable"])
          .item(
            BS5Row(["align-items-center"],
              BS5Col(["col-auto"], 
                H5Span(["badge bg-red"])),
              BS5Col(["col-auto"], 
                H5A(["href":"#"],
                  H5Span(["avatar"], ["style":"background-image: url(./static/avatars/000m.jpg)"]))),
              BS5Col(["col", "text-truncate"],
                H5A(["text-body d-block"], ["href":"#"], "Paweł Kuna"), 
                H5Small(["d-block", "text-muted", "text-truncate", "mt-n1"], "Change deprecated html tags to text decoration classes (#29604)")),
              BS5Col(["col-auto"], 
                H5A(["list-group-item-actions"], ["href":"#"], tablerIcon("star")))))].toH5);
  }

  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string", "info"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return null; }

    debug writeln("Found entities: ", entities.length);

    auto listGroup = BS5ListGroup(["list-group-flush", "list-group-hoverable"]);
    foreach(entity; this.entities) {
      listGroup.item(itemTemplate.entity(entity).toH5(options));
    }

    if (title) this
      .header([BS5CardTitle(title)].toH5);

      this.content([listGroup].toH5);
    
    auto card = BS5Card;
    if (this.header) card.header(this.header);
    if (this.content) card(this.content);
    if (this.footer) card.footer(this.footer);

    return [card].toH5;
  }
}
mixin(APPViewComponentCalls!("APPListViewComponent"));
