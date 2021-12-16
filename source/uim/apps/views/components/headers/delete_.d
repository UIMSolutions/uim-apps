module uim.apps.views.components.headers.delete_;

@safe:
import uim.apps;

class DAPPDeletePageHeader : DAPPPageHeader {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }
  
  override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln("DAPPDeletePageHeader/toH5");

    auto id = entity ? entity.id.toString : UUID().toString;
    return [
      H5Div(["page-header d-print-none"], 
        BS5Row(["align-items-center"])
        .col(["col"], 
          H5Div("pageBreadcrumbs", [BreadcrumbsStyle], mainTitle),
          H5H2(["page-title"], titleDelete(subTitle)))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline g-2"], 
              buttonLinkRefresh(path, id),
              buttonLinkList(path),
              buttonLinkCreate(path),
              buttonLinkView(path, id),
              buttonLinkEdit(path, id)
            )                
          )
        )
      )];
  }
}
auto APPDeletePageHeader() { return new DAPPDeletePageHeader(); }
auto APPDeletePageHeader(DAPPView myView) { return new DAPPDeletePageHeader(myView); }
auto APPDeletePageHeader(DOOPEntity myEntity) { return new DAPPDeletePageHeader(myEntity); }
auto APPDeletePageHeader(string path) { return APPDeletePageHeader.path(path); }
auto APPDeletePageHeader(string path, string preTitle) { return APPDeletePageHeader.path(path).preTitle(preTitle); }
auto APPDeletePageHeader(string path, string preTitle, string title) { return APPDeletePageHeader.path(path).preTitle(preTitle).title(title); }
auto APPDeletePageHeader(string path, string preTitle, string title, string[] actions) { return APPDeletePageHeader.path(path).preTitle(preTitle).title(title).actions(actions); }

