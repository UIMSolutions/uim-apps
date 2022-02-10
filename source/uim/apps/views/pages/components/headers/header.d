/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.pages.components.headers.header;

@safe:
import uim.apps;

class DAPPPageHeader : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPPageHeader"));

  mixin(OProperty!("string", "id"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("string", "preTitle"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string[]", "actions"));
  mixin(OProperty!("string", "mainTitle"));
  mixin(OProperty!("string", "subTitle"));
  mixin(OProperty!("DH5Obj", "breadcrumbs"));

  DH5Obj actionButton(string action, STRINGAA options = null) {
    switch(action) {
      case "refresh": return buttonLinkRefresh(rootPath); 
      case "create": return buttonLinkCreate(rootPath); 
      case "list": return buttonLinkList(rootPath);  
      default: return null;
    }
  } 

  auto actionButtons(STRINGAA options = null) {
    return actions.map!(action => actionButton(action, options)).array;
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
    if ("actions" in options) this.actions = options["actions"].split(",");
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
mixin(APPViewComponentCalls!("APPPageHeader"));
auto APPPageHeader(string rootPath) { return APPPageHeader.rootPath(rootPath); }
auto APPPageHeader(string rootPath, string preTitle) { return APPPageHeader.rootPath(rootPath).preTitle(preTitle); }
auto APPPageHeader(string rootPath, string preTitle, string title) { return APPPageHeader.rootPath(rootPath).preTitle(preTitle).title(title); }
auto APPPageHeader(string rootPath, string preTitle, string title, string[] actions) { return APPPageHeader.rootPath(rootPath).preTitle(preTitle).title(title).actions(actions); }


