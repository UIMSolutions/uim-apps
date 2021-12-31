module uim.apps.views.pages.components.headers.entities.delete_;

@safe:
import uim.apps;

class DAPPDeletePageHeader : DAPPEntityPageHeader {
  mixin(APPPageHeaderThis!("APPDeletePageHeader", Yes.WithEntity));
  
  override void initialize() {
    super.initialize;
    this.actions(["list", "create"]); 
  }
  
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
              buttonLinkRefresh(rootPath, id),
              buttonLinkList(rootPath),
              buttonLinkCreate(rootPath),
              buttonLinkView(rootPath, id),
              buttonLinkEdit(rootPath, id)
            )                
          )
        )
      )];
  }
}
mixin(APPPageHeaderCalls!("APPDeletePageHeader", Yes.WithEntity));
auto APPDeletePageHeader(string rootPath) { return APPDeletePageHeader.rootPath(rootPath); }
auto APPDeletePageHeader(string rootPath, string preTitle) { return APPDeletePageHeader.rootPath(rootPath).preTitle(preTitle); }
auto APPDeletePageHeader(string rootPath, string preTitle, string title) { return APPDeletePageHeader.rootPath(rootPath).preTitle(preTitle).title(title); }
auto APPDeletePageHeader(string rootPath, string preTitle, string title, string[] actions) { return APPDeletePageHeader.rootPath(rootPath).preTitle(preTitle).title(title).actions(actions); }

