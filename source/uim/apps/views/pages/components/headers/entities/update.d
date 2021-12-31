module uim.apps.views.pages.components.headers.entities.update;

@safe:
import uim.apps;

class DAPPEditPageHeader : DAPPEntityPageHeader {
  mixin(APPPageHeaderThis!("APPEditPageHeader", Yes.WithEntity));
  
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
                buttonLinkRefresh(rootPath, id, ["me-3"]),
                buttonLinkList(rootPath, ["me-3"]),
                buttonLinkCreate(rootPath, ["me-1"]),
                buttonLinkView(rootPath, id, ["me-1"]),
                buttonLinkDelete(rootPath, id, [""])
              )                
            )
          )
        )];

  }
}
mixin(APPPageHeaderCalls!("APPEditPageHeader", Yes.WithEntity));
auto APPEditPageHeader(string rootPath) { return APPEditPageHeader.rootPath(rootPath); }
auto APPEditPageHeader(string rootPath, string preTitle) { return APPEditPageHeader.rootPath(rootPath).preTitle(preTitle); }
auto APPEditPageHeader(string rootPath, string preTitle, string title) { return APPEditPageHeader.rootPath(rootPath).preTitle(preTitle).title(title); }
auto APPEditPageHeader(string rootPath, string preTitle, string title, string[] actions) { return APPEditPageHeader.rootPath(rootPath).preTitle(preTitle).title(title).actions(actions); }

