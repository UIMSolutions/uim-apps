module uim.apps.views.login2;

@safe:
import uim.apps;

class DAPPLogin2View : DAPPView {
  mixin(APPViewThis!("APPLogin2View"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DAPPLogin2View~":DAPPLogin2View::beforeH5");
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    DH5Obj[] results;
    DH5Obj[] inners;

    inners ~= BS5Row("messages", ["mt-2 mb-2"]);
    inners ~= H5Div(["text-center mb-4"], 
          H5A(["href":"."], H5Img(["src":"/img/uim.png", "height":"80", "alt":"UI Manufaktur UG - Erfolgreich im Internet"])));
    inners ~= APPLogin2Form.toH5(options);

    results ~= H5Div(["container-tight py-4"], inners);

    return results;       
  }
}
mixin(APPViewCalls!("APPLogin2View"));
