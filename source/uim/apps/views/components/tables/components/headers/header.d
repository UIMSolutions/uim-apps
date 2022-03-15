module uim.apps.views.components.tables.components.headers.header;

@safe:
import uim.apps;

class DAPPTableHeader : DAPPTableComponent {
  mixin(APPViewComponentThis!("APPTableHeader"));

  mixin(OProperty!("STRINGAA[]", "cols"));

  
  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError || "redirect in options") { return null; }

    DH5Obj[] ths;
    foreach(col; cols) {
      auto th = H5Td;
      if ("classes" in col) { th.classes([col["classes"]]); }
      if ("id" in col) { th.id(col["id"]); }
      if ("name" in col) { th.attribute("name", col["name"]); }
      if ("display" in col) { th(col["display"]); }
      if ("content" in col) { th(col["content"]); }
      ths ~= th;
    }

    return [H5Thead.row(ths)].toH5;
  }
}
mixin(APPViewComponentCalls!("APPTableHeader"));
