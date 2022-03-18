module uim.apps.views.object_;

@safe:
import uim.apps;

class DAPPViewObject : DAPPObject {
  this() { super(); }

  // view components
  mixin(OProperty!("DViewComponents", "components"));
  O addComponent(this O)(DAPPViewObject newComponent) {
    components ~= newComponent;
    return cast(O)this;
  }
  O addComponent(this O)(string id, DViewComponent newComponent) {
    components ~= newComponent.id(id);
    return cast(O)this;
  }
  bool hasComponent(string anId) {
    return component(anId) !is null;
  }
  DViewComponent component(string anId) {
    foreach(c; components) {
      if (c.id == anId) return c;
    }
    return null;
  }

/*   bool hasComponent(string key) {
    return (this.component(key) !is null);
  }
  DAPPViewObject component(string key) {
    return this.components.get(key, null);
  }
  O component(this O)(string key, DAPPViewObject newComponent) {
    components[key] = newComponent;
    return cast(O)this;
  }  */
}

/* template APPViewProperty(string dataType, string name) {
  const char[] APPViewProperty = `
  `~dataType~` `~name~`() { return cast(`~dataType~`)this.component("`~name~`"); }
  O `~name~`(this O)(`~dataType~` newComponent) { this.component("`~name~`", newComponent); return cast(O)this; }
  `;
} */

template APPViewProperty(string dataType, string name) {
  const char[] APPViewProperty = `
  protected `~dataType~` _`~name~`;
  `~dataType~` `~name~`() { return _`~name~`; }
  O `~name~`(this O)(`~dataType~` newComponent) { _`~name~` = newComponent; return cast(O)this; }
  `;
}