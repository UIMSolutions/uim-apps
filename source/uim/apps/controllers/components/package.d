module uim.apps.controllers.components;

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.components.component;

// Packages
public import uim.apps.controllers.components.checks;
public import uim.apps.controllers.components.registry;

template AppControllerComponentThis(string name) {
  const char[] AppControllerComponentThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPController myController) { this().controller(myController); }
`;
}

template AppControllerComponentCalls(string name) {
  const char[] AppControllerComponentCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPController myController) { return new D`~name~`(myController); }
`;
}
