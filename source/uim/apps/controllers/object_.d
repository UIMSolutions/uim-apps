module uim.apps.controllers.object_;

@safe:
import uim.apps;

class DAPPControllerObject : DAPPObject {
  this() { super(); }

/*   // controller components
  mixin(OProperty!("DAPPControllerObject[string]", "components")); 
  bool hasComponent(string key) {
    return (this.component(key) !is null);
  }
  DAPPControllerObject component(string key) {
    return this.components.get(key, null);
  }
  O component(this O)(string key, DAPPControllerObject newComponent) {
    components[key] = newComponent;
    return cast(O)this;
  } */
}

template APPControllerProperty(string dataType, string name) {
  const char[] APPControllerProperty = `
  `~dataType~` `~name~`() { return cast(`~dataType~`)this.component("`~name~`"); }
  O `~name~`(this O)(`~dataType~` newComponent) { this.component("`~name~`", newComponent); return cast(O)this; }
  `;
}