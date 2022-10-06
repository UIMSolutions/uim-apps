module uim.apps.views.base;

@safe:
import uim.apps;

class DAPPBaseView : DAPPObject {
  this() { super(); }

  mixin(APPParameter!("rootPath"));

  override void initialize() {
    super.initialize;
  }

  override void opIndexAssign(string newValue, string key) {
    this.parameter(key, newValue);
  }

  override string opIndex(string key) {
    switch(key) {
      default: return super.opIndex(key);
    }
  }

  void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPBaseView~":DAPPBaseView("~this.name~")::beforeH5");
    // init
    _error = null; // Delete last error

  }
}

