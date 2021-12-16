module uim.apps.views.login2;

@safe:
import uim.apps;

class DAPPViewLogin2 : DAPPView {
  this() { super(); }
  this(DH5AppController aController) { this().controller(aController); }
  this(string aName) { this().name(aName); }
  this(DH5AppController aController, string aName) { this(aController).name(aName); }

  override void beforeH5(STRINGAA options = null) { 
    debug writeln(StyledString(moduleName!DAPPViewLogin2~":DAPPViewLogin2::beforeH5").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeH5(options);
    auto loginIdParameter = options.get("loginId", "");

    _h5Content ~= H5Div(["container-tight py-4"], 
      BS5Row("messages", ["mt-2 mb-2"]),
      H5Div(["text-center mb-4"], 
        H5A(["href":"."], H5Img(["src":"/img/uim.png", "height":"80", "alt":"UI Manufaktur UG - Erfolgreich im Internet"]))),
        appLogin2Form(loginIdParameter));       
  }
}
auto APPViewLogin2() { return new DAPPViewLogin2(); }
auto APPViewLogin2(DH5AppController aController) { return new DAPPViewLogin2(aController); }
auto APPViewLogin2(string aName) { return new DAPPViewLogin2(aName); }
auto APPViewLogin2(DH5AppController aController, string aName) { return new DAPPViewLogin2(aController, aName); }