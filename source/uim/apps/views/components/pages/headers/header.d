module uim.apps.views.components.pages.headers.header;

@safe:
import uim.apps;

class DPageHeader : DViewComponent {
  mixin(ViewComponentThis!("PageHeader"));

  mixin(APPParameter!("rootPath"));
  mixin(APPParameter!("preTitle"));
  mixin(APPParameter!("title"));
  mixin(OProperty!("string[][]", "actions"));
  mixin(APPParameter!("mainTitle"));
  mixin(APPParameter!("subTitle"));
  mixin(OProperty!("DH5Obj", "breadcrumbs"));
  mixin(APPParameter!("breadcrumbsStyle"));
  

  DH5Obj actionButton(string action, STRINGAA options = null) {
    auto id = entity ? entity.id.toString : UUID().toString;      
  
    switch(action) {
      case "refresh": return buttonLinkRefresh(rootPath); 
      case "create": return buttonLinkCreate(rootPath); 
      case "list": return buttonLinkList(rootPath);  
      case "read": 
      case "view": return buttonLinkView(rootPath, id); 
      case "edit": 
      case "update": return buttonLinkEdit(rootPath, id); 
      case "delete": 
      case "remove": return buttonLinkDelete(rootPath, id); 
      case "version":return null; // Working on it 
      case "lock":return null;  
      case "unlock":return null; 
      case "print":return null; 
      case "export":return null; 
      case "import":return null; 
      default: return null;
    }
  } 

  auto actionButtons(STRINGAA options = null) {
    return actions.join
      .map!(action => actionButton(action, options)).array;
  } 

  override string render(STRINGAA options = null) {
    // debug writeln("DAPPCreatePageHeader/toString");
    auto h5 = toH5(options);
    return h5 ? h5.map!(a => a.toString).join : "";
  }

  // #region h5
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    if ("rootPath" in options) this.rootPath = options["rootPath"];
    if ("preTitle" in options) this.preTitle = options["preTitle"];
    if ("title" in options) this.title = options["title"];
    if ("actions" in options) this.actions = [options["actions"].split(",")];
    if ("mainTitle" in options) this.mainTitle = options["mainTitle"];
    if ("subTitle" in options) this.subTitle = options["subTitle"];
    // TODO what to do with following?
/*     mixin(OProperty!("DH5Obj", "breadcrumbs"));
    mixin(OProperty!("DOOPEntity", "entity"));
 */  
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
     
    return
      [
        H5Div(id, ["page-header d-print-none mb-3"], 
        BS5Row(["align-items-center"])
        .col(["col"], 
          H5Div(["text-small mb-1"], breadcrumbs),
          H5H2(["page-title"], title))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], actionButtons(options))
        ))
      ].toH5;
  }
}
mixin(ViewComponentCalls!("PageHeader"));
