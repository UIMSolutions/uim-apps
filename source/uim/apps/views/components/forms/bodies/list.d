module uim.apps.views.components.forms.bodies.list;

@safe:
import uim.apps;

class DAPPListFormBody : DAPPFormBody {
  this() { super(); 
    this
    .tableHeader(APPListTableHeader)
    .tableFilter(APPListTableFilter);
  }
  this(DAPPForm myForm) { this().form(myForm); }

  mixin(OProperty!("DOOPEntity[]", "entities"));
  mixin(SProperty!("DAPPListTableHeader", "tableHeader"));
  mixin(SProperty!("DAPPListTableFilter", "tableFilter"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    auto row(DOOPEntity entity) {
      if (!entity) return null;
      return
        H5Tr
        .td(
          BS5FormCheckInput("${entity.id}", ["m-0 align-middle"], ["type":"checkbox", "aria-label":"Select item"]))// , "checked": entity.selected? `checked`:``)+`>
        .td(["w-1"], entity["createdOn"])
        .td(["w-1"], entity["modifiedOn"])
        .td(["w-1"], H5A(["href": path~"/view?entity_id="~entity["id"]], entity["name"]))
        .td(entity["display"]) 
        .td(["text-end"], 
          H5Span(["dropdown"], 
            BS5Button(["btn-sm dropdown-toggle align-text-top"], 
              ["data-bs-boundary":"viewport", "data-bs-toggle":"dropdown", "aria-expanded":"false"], "Mehr"),
            BS5DropdownMenu(["dropdown-menu-end"])
            .link(["href":path~"/view?entity_id="~entity["id"]], "Anzeigen")
            .link(["href":path~"/edit?entity_id="~entity["id"]], "Edit")
            .link(["href":path~"/delete?entity_id="~entity["id"]], "Delete")
            .divider
            .link(["disabled"], ["href":"#"], "Kopieren")
            .link(["disabled"], ["href":"#"], "Drucken")
            .link(["disabled"], ["href":"#"], "Exportieren")
          ));
    }

    string rows = entities.map!(a => a ? row(a).toString : "").join; 

    auto table = H5Div(["table-responsive"],
      BS5Table(["card-table table-vcenter text-nowrap datatable table table-hover"])
      .header(
        (tableHeader ? tableHeader.toH5(options) : null)~
        (tableFilter ? tableFilter.toH5(options) : null))
      .body_("tableBody", rows));

    _h5Content ~= 
      BS5Card
        .header(
          H5H3(["card-title"], "Gefundene "~(form ? form.entitiesName : "")))
        .body_(["border-bottom py-3"], 
          H5Div(["d-flex"],
            viewEntities(10)~ 
            APPSearchInList.toH5(form ? ["entitiesName":form.entitiesName] : null)
            )
          )
        (table)
        .footer(["d-flex align-items-center"], 
          H5P("availableEntites",["m-0 text-muted"], "Anzeige <span>1</span> bis <span>8</span> von <span>18</span> Einträgen"),
          H5Ul("pagesEntites", ["m-0 ms-auto pagination"], linkPrev("prevEntities"))
          .li(["page-item active"], 
            H5A("pageDisplay", ["page-link"], "1"))
          (linkNext("nextEntities")));
  } 
}
auto APPListFormBody() { return new DAPPListFormBody; }
auto APPListFormBody(DAPPForm myForm) { return new DAPPListFormBody(myForm); }
