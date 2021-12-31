module uim.apps.views.login2;

@safe:
import uim.apps;

class DAPPLogin2View : DAPPView {
  mixin(APPViewThis!("APPLogin2View"));
  this(string aName) { this().name(aName); }
  this(DAPPPageController aController, string aName) { this(aController).name(aName); }

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DAPPLogin2View~":DAPPLogin2View::beforeH5");
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    auto loginIdParameter = options.get("loginId", "");

    return [
      H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        H5Div(["text-center mb-4"], 
          H5A(["href":"."], H5Img(["src":"/img/uim.png", "height":"80", "alt":"UI Manufaktur UG - Erfolgreich im Internet"]))),
          appLogin2Form(loginIdParameter))].toH5;       
  }
}
auto APPLogin2View() { return new DAPPLogin2View(); }
auto APPLogin2View(DAPPPageController aController) { return new DAPPLogin2View(aController); }
auto APPLogin2View(string aName) { return new DAPPLogin2View(aName); }
auto APPLogin2View(DAPPPageController aController, string aName) { return new DAPPLogin2View(aController, aName); }