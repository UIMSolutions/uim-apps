module uim.apps.views.components;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.component;
public import uim.apps.views.components.components;
public import uim.apps.views.components.null_;
public import uim.apps.views.components.static_;

// Packages
public import uim.apps.views.components.accordions;
public import uim.apps.views.components.alerts;
public import uim.apps.views.components.avatars;
public import uim.apps.views.components.badges;
public import uim.apps.views.components.breadcrumbs;
public import uim.apps.views.components.buttons;
public import uim.apps.views.components.cards;

public import uim.apps.views.components.filter;
public import uim.apps.views.components.forms;
public import uim.apps.views.components.footers;
public import uim.apps.views.components.icons;
public import uim.apps.views.components.lists;
public import uim.apps.views.components.navbars;
public import uim.apps.views.components.modals;
public import uim.apps.views.components.search;
public import uim.apps.views.components.tables;
public import uim.apps.views.components.tabpanes;
public import uim.apps.views.components.tabs;

DH5Obj viewEntities(uint initValue = 10) {
  return H5Div(["text-muted"], 
    H5String("Anzeige "),
    H5Div(["mx-2 d-inline-block"], 
      BS5InputNumber("viewEntities", ["form-control-sm"], ["aria-label":"Entities count", "size":"3", "min":"0"]).value(initValue)
    ),
    H5Div("Einträge"));
}

template ViewComponentThis(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentThis = `
this() { super(); this.name = "`~classShortName~`"; }
this(DAPPView myView) { this().view(myView); }`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
` : ``)~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DAPPView myView, DOOPEntity[] myEntities) { this(myView).entities(myEntities); }
` : ``);

}

template ViewComponentCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DAPPView myView) { return new D`~classShortName~`(myView); }`~
(withEntity ? `
auto `~classShortName~`(DOOPEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DAPPView myView, DOOPEntity myEntity) { return new D`~classShortName~`(myView, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DOOPEntity[] myEntities) { return new D`~classShortName~`(myEntities); }
auto `~classShortName~`(DAPPView myView, DOOPEntity[] myEntities) { return new D`~classShortName~`(myView, myEntities); }
` : ``);
}