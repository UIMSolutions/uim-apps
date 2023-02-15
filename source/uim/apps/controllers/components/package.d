module uim.apps.controllers.components;

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.components.component;

// Packages
public import uim.apps.controllers.components.checks;
public import uim.apps.controllers.components.registry;

/* template ControllerComponentThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] ControllerComponentThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPController myController) { this().controller(myController); }
`;
}

template ControllerComponentCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] ControllerComponentCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPController myController) { return new D`~name~`(myController); }
`;
} */
