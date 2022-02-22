module uim.apps.views.components.forms.components.bodies.entities;

@safe:
import uim.apps;

class DAPPEntitiesFormBody : DAPPFormBody, IAPPWithEntities {
  mixin(APPFormComponentThis!("APPEntitiesFormBody"));

  override void initialize() {
    super.initialize;

    this
    .tableHeader(APPEntitiesTableHeader)
    .tableFilter(APPEntitiesTableFilter); 
  }

  mixin(OProperty!("DAPPViewComponent", "tableHeader"));
  mixin(OProperty!("DAPPViewComponent", "tableFilter"));
  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesFormBody~"DAPPEntitiesFormBody::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln("in DAPPEntitiesEntitiesForm "~(this.entities ? "Has %s entities".format(this.entities.length) : "No entities"));

    debug writeln("Before RootPath = ", this.rootPath);
    if (form) {
      this.crudMode(form.crudMode); 
      this.readonly(form.readonly); 
      this.rootPath(form.rootPath); 
    }

    debug writeln(entities ? "Has entities" : "No entities");
    if (auto entitiesForm = cast(IAPPWithEntities)this.form) {
      debug writeln("Found entitiesForm");
      this.entities(entitiesForm.entities);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesFormBody~"DAPPEntitiesFormBody::toH5");
    super.toH5(options);

    debug writeln("RootPath = ", this.rootPath);

    auto row(DOOPEntity entity) {
      if (!entity) return null;
      
      return [
        H5Tr
        .td(
          BS5FormCheckInput("${entity.id}", ["m-0 align-middle"], ["type":"checkbox", "aria-label":"Select item"]))// , "checked": entity.selected? `checked`:``)+`>
        .td(["w-1"], germanDate(to!long(entity["createdOn"])))
        .td(["w-1"], germanDate(to!long(entity["modifiedOn"])))
        .td(["w-1"], H5A(["href": rootPath~"/view?id="~entity["id"]], entity["name"]))
        .td(entity["display"]) 
        .td(["text-end"], 
          H5Span(["dropdown"], 
            BS5Button(["btn-sm dropdown-toggle align-text-top"], 
              ["data-bs-boundary":"viewport", "data-bs-toggle":"dropdown", "aria-expanded":"false"], "Mehr"),
            BS5DropdownMenu(["dropdown-menu-end"])
            .link(["href":rootPath~"/view?id="~entity["id"]], "Anzeigen")
            .link(["href":rootPath~"/edit?id="~entity["id"]], "Edit")
            .link(["href":rootPath~"/delete?id="~entity["id"]], "Delete")
            .divider
            .link(["disabled"], ["href":"#"], "Kopieren")
            .link(["disabled"], ["href":"#"], "Drucken")
            .link(["disabled"], ["href":"#"], "Exportieren")
          ))].toH5;
    }

    debug writeln("Found entities for table = ", entities.length);
    DH5Obj[] rows = entities.map!(a => a ? row(a) : null).join; 

    auto table = H5Div(["table-responsive"],
      BS5Table(["card-table table-vcenter text-nowrap datatable table table-hover"])
      .header(
        (tableHeader ? tableHeader.toH5(options) : null)~
        (tableFilter ? tableFilter.toH5(options) : null))
      .body_("tableBody", rows));
      
    return [
      BS5Card
      .header(
        H5H3(["card-title"], title))
      .body_(["border-bottom py-3"], 
        H5Div(["d-flex"],
          viewEntities(10)
          /* APPSearchInEntities.toH5(form ? ["entitiesName":form.entitiesName] : null) */
          )
        )
      (table)
      .footer(["d-flex align-items-center"], 
        H5P("availableEntites",["m-0 text-muted"], "Anzeige <span>1</span> bis <span>8</span> von <span>18</span> Einträgen"),
        H5Ul("pagesEntites", ["m-0 ms-auto pagination"], linkPrev("prevEntities"))
        .li(["page-item active"], 
          H5A("pageDisplay", ["page-link"], "1"))
        (linkNext("nextEntities")))
      ].toH5;
  } 
}
mixin(APPFormComponentCalls!("APPEntitiesFormBody"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPEntitiesFormBody);
    assert(APPEntitiesFormBody);
    assert(new DAPPEntitiesFormBody(APPForm));
    assert(APPEntitiesFormBody(APPForm));
  }
}