module uim.apps.views.components.headers.header;

@safe:
import uim.apps;

class DAPPPageHeader : DAPPViewComponent {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }

  mixin(SProperty!("string", "path"));
  mixin(SProperty!("string", "preTitle"));
  mixin(SProperty!("string", "title"));
  mixin(SProperty!("string[]", "actions"));
  mixin(SProperty!("string", "mainTitle"));
  mixin(SProperty!("string", "subTitle"));
  mixin(SProperty!("DH5Obj", "breadcrumbs"));
  mixin(SProperty!("DOOPEntity", "entity"));

  auto actionButtons(string[] actions) {
    auto id = entity ? entity.id.toString : UUID().toString;      

    DH5Obj[] results; 
    foreach (action; actions) {
      switch(action) {
        case "refresh": results ~= buttonLinkRefresh(path); break;
        case "create": results ~= buttonLinkCreate(path); break;
        case "list": results ~= buttonLinkList(path); break; 
        case "view": results ~= buttonLinkView(path, id); break;
        case "edit": results ~= buttonLinkEdit(path, id); break;
        case "delete": results ~= buttonLinkDelete(path, id); break;
        default: break;
      }
    }
    return results;
  } 

  override string render(STRINGAA options = null) {
    // debug writeln("DAPPCreatePageHeader/toString");
    auto h5 = toH5(options);
    return h5 ? h5.map!(a => a.toString).join : "";
  }

  // #region h5
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    if ("path" in options) this.path = options["path"];
    if ("preTitle" in options) this.preTitle = options["preTitle"];
    if ("title" in options) this.title = options["title"];
    if ("actions" in options) this.actions = options["actions"].split(",");
    if ("mainTitle" in options) this.mainTitle = options["mainTitle"];
    if ("subTitle" in options) this.subTitle = options["subTitle"];
    // TODO what to do with following?
/*     mixin(SProperty!("DH5Obj", "breadcrumbs"));
    mixin(SProperty!("DOOPEntity", "entity"));
 */  
  
    auto id = entity ? entity.id.toString : UUID().toString;      
    _h5Content = null; 
    _h5Content ~=
      H5Div(id, ["page-header d-print-none"], 
        BS5Row(["align-items-center"])
        .col(["col"], 
          H5Div(["text-small mb-1"], breadcrumbs),
          H5H2(["page-title"], titleList(title)))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], actionButtons(actions))
        ));
  }
}
auto APPPageHeader() { return new DAPPPageHeader(); }
auto APPPageHeader(DAPPView myView) { return new DAPPPageHeader(myView); }
auto APPPageHeader(DOOPEntity myEntity) { return new DAPPPageHeader(myEntity); }
auto APPPageHeader(string path) { return APPPageHeader.path(path); }
auto APPPageHeader(string path, string preTitle) { return APPPageHeader.path(path).preTitle(preTitle); }
auto APPPageHeader(string path, string preTitle, string title) { return APPPageHeader.path(path).preTitle(preTitle).title(title); }
auto APPPageHeader(string path, string preTitle, string title, string[] actions) { return APPPageHeader.path(path).preTitle(preTitle).title(title).actions(actions); }


