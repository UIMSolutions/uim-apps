module uim.apps.views.components;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.component;

// Packages
public import uim.apps.views.components.buttons;
public import uim.apps.views.components.filter;
public import uim.apps.views.components.forms;
public import uim.apps.views.components.footers;
public import uim.apps.views.components.icons;
public import uim.apps.views.components.navbars;
public import uim.apps.views.components.modals;
public import uim.apps.views.components.panes;
public import uim.apps.views.components.search;
public import uim.apps.views.components.tables;

DH5Obj viewEntities(uint initValue = 10) {
  return H5Div(["text-muted"], 
    H5String("Anzeige "),
    H5Div(["mx-2 d-inline-block"], 
      BS5InputNumber("viewEntities", ["form-control-sm"], ["aria-label":"Entities count", "size":"3", "min":"0"]).value(initValue)
    ),
    H5Div("Einträge"));
}

template APPViewComponentThis(string name) {
  const char[] APPViewThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPView myView) { this().view(myView); }
`;
}

template APPViewComponentCalls(string name) {
  const char[] APPViewCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }
`;
}