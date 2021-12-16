module uim.apps.views.components.headers.create;

@safe:
import uim.apps;

class DAPPCreatePageHeader : DAPPPageHeader {
  this() { super(); 
    this.actions(["list", "create"]); }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    // debug writeln("DAPPCreatePageHeader/toH5");
    DH5Obj[] buttons;
    foreach (action; this.actions) {
      switch(action) {
        case "list": 
          buttons ~= buttonLinkList(path); break;
        case "refresh": 
          buttons ~= buttonLinkRefresh(path); break;
        case "create":
          buttons ~= buttonLinkCreate(path); break;
        default: break; }} 

/*     string bcrumbs;
    foreach (index, data; breadcrumbs) { 
      if (index < data.length-1) bcrumbs ~= `<li class="breadcrumb-item"><a href="%s">%s</a></li>`.format(data["url"], data["title"]);
      else bcrumbs ~= `<li class="breadcrumb-item active" aria-current="page"><a href="#">%s</a></li>`.format(data["title"]);
    }
 */
    auto id = entity ? entity.id.toString : UUID().toString;
    return
      [H5Div(id, ["page-header d-print-none"], 
        BS5Row(["align-items-center"])
          .col(["col"], 
            H5Div("pageBreadcrumbs", [BreadcrumbsStyle], H5Ol(["breadcrumb"], ["aria-label":"breadcrumbs"], breadcrumbs)),
            H5H2(["page-title"], titleList(title)))
          .col(["col-auto ms-auto d-print-none"], 
            H5Div(["btn-list"], buttons) // H5Span(["d-none d-sm-inline"]
          )
        )].toH5;
  }
}
auto APPCreatePageHeader() { return new DAPPCreatePageHeader(); }
auto APPCreatePageHeader(DAPPView myView) { return new DAPPCreatePageHeader(myView); }
auto APPCreatePageHeader(DOOPEntity myEntity) { return new DAPPCreatePageHeader(myEntity); }
auto APPCreatePageHeader(string path) { return APPCreatePageHeader.path(path); }
auto APPCreatePageHeader(string path, string preTitle) { return APPCreatePageHeader.path(path).preTitle(preTitle); }
auto APPCreatePageHeader(string path, string preTitle, string title, string[] actions = ["list", "create"]) { return APPCreatePageHeader.path(path).preTitle(preTitle).title(title).actions(actions); }

