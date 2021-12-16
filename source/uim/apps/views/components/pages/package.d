module uim.apps.views.components.pages;

@safe:
import uim.apps;

class DAPPPageTitle : DAPPViewComponent { 
  this()  { super(); }

  override DH5Obj[] toH5(STRINGAA options = null) { 
    return
      [H5Div(["container-fluid "], 
        H5Div(["page-header d-print-none"], 
          BS5Row(["align-items-center"])
          .col(["col"], 
            H5Div("pageBreadcrumbs", [BreadcrumbsStyle], options.get("pageBreadcrumbs", "")),
            H5H2(["page-title"], options.get("pageTitle", "")))
          .col(["col-auto ms-auto d-print-none"], 
            H5Div(["btn-list"],
              H5Span(["d-none d-sm-inline"], BS5Button(["btn btn-white"], "New view")),
              H5A(["btn btn-primary d-none d-sm-inline-block"], ["href":"#", "data-bs-toggle":"modal", "data-bs-target":"#modal-report", "style":"background-color:#35A6FF"], tablerIcon("plus")~"Create new report"),
              H5A(["btn btn-primary d-sm-none btn-icon"], ["href":"#", "data-bs-toggle":"modal", "data-bs-target":"#modal-report", "aria-label":"Create new report", "style":"background-color:#35A6FF"], tablerIcon("plus"))
            )
          )
        )
      )].toH5;  
  }
}
auto APPPageTitle() { return new DAPPPageTitle; }

auto myJsPath = "";

void crudPages(T:DOOPEntity)(DH5App app) {
  auto entity = new T;
  auto entityClasses = entity.entityClasses;
  // debug writeln(entityClasses); 
  if (entityClasses.indexOf("uim") == 0) app.crudPages!T(entityClasses.replace("uim", "uim/"), entityClasses);
  if (entityClasses.indexOf("bsi") == 0) app.crudPages!T(entityClasses.replace("bsi", "bsi/"), entityClasses);
}

void crudPages(T:DOOPEntity)(DH5App app, string name, string pool) {
  auto api = /* "api/v1/uim/" */name;
  auto url = "entities/"~name;
  crudPages!T(app, api, pool, url); 
}

void crudPages(T:DOOPEntity)(DH5App app, string api, string pool, string url) {
  // debug writeln(url); 
  app.pages(url,            new DAPPListPage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/create",  new DAPPCreatePage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/read",    new DAPPReadPage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/update",  new DAPPUpdatePage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/delete",  new DAPPDeletePage!T()/* .api(api).pool(pool).url(url) */);
}