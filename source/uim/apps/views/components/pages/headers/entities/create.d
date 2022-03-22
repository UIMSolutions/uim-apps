module uim.apps.views.components.pages.headers.entities.create;

@safe:
import uim.apps;

class DAPPCreatePageHeader : DPageHeader {
  mixin(ViewComponentThis!("APPCreatePageHeader", Yes.WithEntity));
  
  override void initialize() {
    super.initialize;
    
    this
      .actions([["list", "create"]]); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    // debug writeln("DAPPCreatePageHeader/toH5");
    DH5Obj[] buttons = actionButtons(options);

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
mixin(ViewComponentCalls!("APPCreatePageHeader", Yes.WithEntity));
