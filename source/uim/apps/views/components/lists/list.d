module uim.apps.views.components.lists.list;

@safe:
import uim.apps;

class DAPPListViewComponent : DAPPViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPListViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
  mixin(SProperty!("DH5Obj", "noEntities"));
  mixin(SProperty!("DOOPEntity[UUID]", "themesById"));

  mixin(OProperty!("bool", "showHeader"));
  mixin(OProperty!("bool", "showNumber"));
  mixin(OProperty!("bool", "showSorter"));
  mixin(OProperty!("bool", "showFilter"));

  mixin(OProperty!("DH5Obj[]", "header"));
  mixin(OProperty!("DH5Obj[]", "content"));
  mixin(OProperty!("DH5Obj[]", "footer"));  

  mixin(OProperty!("STRINGAA", "filterValues"));  
  mixin(OProperty!("STRINGAA", "sortValues"));  

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
                H5A(["list-group-item-actions mt-2"], ["href":"#"], tablerIcon("star")))))].toH5);
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

    auto cardTitleRow = BS5Row;
    auto cardTitle = BS5CardTitle(["d-block"], cardTitleRow);

    if (title || showNumber) {
      cardTitleRow.col(["col-auto"], title~
        (showNumber ? BS5Badge(["ms-1 badge-pill badge-sm"], to!string(this.entities.length)).toString : null)); 
    }

    string[] filterParameters;
    if (showFilter) {
      DH5Obj[] selectOptions;
      foreach(k; filterValues.byKey.array.sort) {
        selectOptions ~= H5Option(["value":k], filterValues[k]).selected(options.get("filterBy", null) == k);
      }

      auto filter = BS5Form(["action":options.get("path", null),
        "method":"get"],
        ("sortBy" in options ? BS5InputHidden(["name":"sortBy", "value":options["sortBy"]]) : null),
        ("sortDir" in options ? BS5InputHidden(["name":"sortDir", "value":options["sortDir"]]) : null),
        H5Div(["input-group"],
          BS5InputText(["form-control-sm"], ["name":"filterValue", "placeholder":"Filter value...", "value": options.get("filterValue", null)]),
          BS5InputSelect(["form-control-sm"], ["name":"filterBy"], selectOptions),
          BS5ButtonSubmit(["btn-sm"], "Filtern")
      ));
      cardTitleRow.col(["ms-auto col-auto"], filter);

      filterParameters = ("filterBy" in options ? ["filterBy="~options["filterBy"]] : [])~("filterValue" in options ? ["filterValue="~options["filterValue"]] : []);
    }
    if (showSorter) {
      DH5Obj[] sortDropItems;
      foreach(k; sortValues.byKey.array.sort) {
        sortDropItems ~= BS5DropdownLink(["href":"?"~(filterParameters ? filterParameters.join("&")~"&" : null)~"sortBy="~k~"&sortDir=up"], sortValues[k]~" aufsteigend");
        sortDropItems ~= BS5DropdownLink(["href":"?"~(filterParameters ? filterParameters.join("&")~"&" : null)~"sortBy="~k~"&sortDir=down"], sortValues[k]~" absteigend");
      }

      auto sorter = BS5Dropdown;
      sorter
        .link(["btn-primary btn-sm"], "Sortieren")
        .menu(sortDropItems);

      cardTitleRow.col(["ms-auto col-auto"], sorter);
    }

    if (showHeader) {
      this
      .header([cardTitle].toH5);
    }

    this.content([listGroup].toH5);
    
    auto card = BS5Card;
    if (this.header) card.header(["d-block"], this.header);
    if (this.content) card(this.content);
    if (this.footer) card.footer(["d-block"], this.footer);

    return [card].toH5;
  }
}
mixin(APPViewComponentCalls!("APPListViewComponent"));
