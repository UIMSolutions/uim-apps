module uim.apps.views.components.headers.edit;

@safe:
import uim.apps;

class DAPPEditPageHeader : DAPPPageHeader {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }
  
  override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln("DAPPEditPageHeader/toH5");

    auto id = entity ? entity.id.toString : UUID().toString;
    return
      [H5Div(["page-header d-print-none"], 
        BS5Row(["align-items-center"])
        .col(["col"], 
            H5Div("pageBreadcrumbs", [BreadcrumbsStyle], breadcrumbs),
            H5H2(["page-title"], titleEdit("Bearbeiten")))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline g-2"], 
                buttonLinkRefresh(path, id, ["me-3"]),
                buttonLinkList(path, ["me-3"]),
                buttonLinkCreate(path, ["me-1"]),
                buttonLinkView(path, id, ["me-1"]),
                buttonLinkDelete(path, id, [""])
              )                
            )
          )
        )];

  }
}
auto APPEditPageHeader() { return new DAPPEditPageHeader(); }
auto APPEditPageHeader(DAPPView myView) { return new DAPPEditPageHeader(myView); }
auto APPEditPageHeader(DOOPEntity myEntity) { return new DAPPEditPageHeader(myEntity); }
auto APPEditPageHeader(string path) { return APPEditPageHeader.path(path); }
auto APPEditPageHeader(string path, string preTitle) { return APPEditPageHeader.path(path).preTitle(preTitle); }
auto APPEditPageHeader(string path, string preTitle, string title) { return APPEditPageHeader.path(path).preTitle(preTitle).title(title); }
auto APPEditPageHeader(string path, string preTitle, string title, string[] actions) { return APPEditPageHeader.path(path).preTitle(preTitle).title(title).actions(actions); }

