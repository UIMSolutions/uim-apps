module uim.apps.views.components.headers.view;

@safe:
import uim.apps;

class DAPPViewPageHeader : DAPPPageHeader {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }
  
  override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln(StyledString("DAPPViewPageHeader/toH5").setForeground(AnsiColor.green).setBackground(AnsiColor.lightBlue));

    auto id = entity ? entity.id.toString : UUID().toString;
    return
      [H5Div(["page-header d-print-none"], 
        BS5Row(["row align-items-center"])
        .col(["col"], 
          H5Div("pageBreadcrumbs", [BreadcrumbsStyle], breadcrumbs),
          H5H2(["page-title"], titleView(title)))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline g-2"], 
              buttonLinkRefresh(path, id),
              buttonLinkList(path),
              buttonLinkCreate(path, ["me-1"]),
              buttonLinkEdit(path, id, ["me-1"]),
              buttonLinkDelete(path, id)
            )
          )
        )
      )];
  }
}
auto APPViewPageHeader() { return new DAPPViewPageHeader(); }
auto APPViewPageHeader(DAPPView myView) { return new DAPPViewPageHeader(myView); }
auto APPViewPageHeader(DOOPEntity myEntity) { return new DAPPViewPageHeader(myEntity); }
auto APPViewPageHeader(string path) { return APPViewPageHeader.path(path); }
auto APPViewPageHeader(string path, string preTitle) { return APPViewPageHeader.path(path).preTitle(preTitle); }
auto APPViewPageHeader(string path, string preTitle, string title) { return APPViewPageHeader.path(path).preTitle(preTitle).title(title); }
auto APPViewPageHeader(string path, string preTitle, string title, string[] actions) { return APPViewPageHeader.path(path).preTitle(preTitle).title(title).actions(actions); }
