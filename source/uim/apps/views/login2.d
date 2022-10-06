module uim.apps.views.login2;

@safe:
import uim.apps;

class DAPPLogin2View : DAPPView {
  mixin(ViewThis!("APPLogin2View"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DAPPLogin2View~":DAPPLogin2View::beforeH5");
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    return [
      H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        BS5Row("logo", ["text-center"],  
          H5A(["href":"https://www.sicherheitsschmiede.de"], 
            H5Img(["src":"/img/logo.png", "height":"80", "alt":"Sicherheitsschmiede - Sicher im Internet"]))),
        BS5Row("form", APPLogin2Form.toH5(options)))
    ].toH5;
  }
}
mixin(ViewCalls!("APPLogin2View"));

version(test_uim_apps) { unittest {
  assert(APPLogin2View);
}}