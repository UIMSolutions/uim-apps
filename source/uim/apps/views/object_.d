module uim.apps.views.object_;

@safe:
import uim.apps;

class DViewObject : DAPPObject {
  this() { super(); }

  mixin(OProperty!("DViewComponents", "components"));
  mixin(APPParameter!("rootPath"));

  override void initialize() {
    super.initialize;

    this
      .components(
        ViewComponents(this));
  }

  O addComponent(this O)(DViewComponent newComponent) {
    this.components.set(newComponent);
    return cast(O)this;
  }

  O addComponent(this O)(string anId, DViewComponent newComponent) {
    this.components.set(anId, newComponent);
    return cast(O)this;
  }

  void opIndexAssign(DViewComponent newComponent, string anId) {
    addComponent(anId, newComponent);
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
    debugMethodCall(moduleName!DViewObject~":DViewObject("~this.name~")::beforeH5");
    // init
    _error = null; // Delete last error

    this.components.all.each!(comp => comp.rootPath(this.rootPath));
  }
}

