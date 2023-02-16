module uim.apps.views.components.pages.headers.entities.delete_;

@safe:
import uim.apps;

class DAPPDeletePageHeader : DPageHeader {
  mixin(ViewComponentThis!("APPDeletePageHeader", Yes.WithEntity));
  
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;
    this.actions([["list", "create"]]); 
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
/*               buttonLinkRefresh(rootPath, id),
              buttonLinkList(rootPath),
              buttonLinkCreate(rootPath),
              buttonLinkView(rootPath, id),
              buttonLinkEdit(rootPath, id) */
            )                
          )
        )
      )];
  }
}
mixin(ViewComponentCalls!("APPDeletePageHeader", Yes.WithEntity));
