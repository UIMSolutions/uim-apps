module uim.apps.controllers.object_;

@safe:
import uim.apps;

class DBaseController : DAPPObject {
  this() { super(); }

/*   // controller components
  mixin(OProperty!("DBaseController[string]", "components")); 
  bool hasComponent(string key) {
    return (this.component(key) !is null);
  }
  DBaseController component(string key) {
    return this.components.get(key, null);
  }
  O component(this O)(string key, DBaseController newComponent) {
    components[key] = newComponent;
    return cast(O)this;
  } */
}

template ControllerProperty(string dataType, string name) {
  const char[] ControllerProperty = `
  `~dataType~` `~name~`() { return cast(`~dataType~`)this.component("`~name~`"); }
  O `~name~`(this O)(`~dataType~` newComponent) { this.component("`~name~`", newComponent); return cast(O)this; }
  `;
}