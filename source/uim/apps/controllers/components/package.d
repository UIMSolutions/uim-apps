module uim.apps.controllers.components;

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.components.component;

// Packages
public import uim.apps.controllers.components.checks;
public import uim.apps.controllers.components.registry;

template APPControllerComponentThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPControllerComponentThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPController myController) { this().controller(myController); }
`;
}

template APPControllerComponentCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPControllerComponentCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPController myController) { return new D`~name~`(myController); }
`;
}
