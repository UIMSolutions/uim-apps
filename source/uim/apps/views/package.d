module uim.apps.views;

@safe:
import uim.apps;

// Main
public import uim.apps.views.view;
public import uim.apps.views.list;

// Packages
public import uim.apps.views.components;
public import uim.apps.views.entities;
public import uim.apps.views.pages;

// pageses
public import uim.apps.views.block;
public import uim.apps.views.login;
public import uim.apps.views.login2;
public import uim.apps.views.logout;
public import uim.apps.views.lostaccount;
public import uim.apps.views.lostpw;
public import uim.apps.views.registry;
public import uim.apps.views.sites;

enum ViewModes { HTML, JS, XML }

template APPViewThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPViewThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPPageController myController) { this().controller(myController); }
this(string myName) { this().name(myName); }
this(DAPPPageController myController, string myName) { this(myController).name(myName); }
`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPPageController myController, DOOPEntity myEntity) { this(myController).entity(myEntity); }
` : ``)~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DAPPPageController myController, DOOPEntity[] myEntities) { this(myController).entities(myEntities); }
` : ``);
;
}

template APPViewCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] APPViewCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DAPPPageController myController) { return new D`~classShortName~`(myController); }
auto `~classShortName~`(string myName) { return new D`~classShortName~`(myName); }
auto `~classShortName~`(DAPPPageController myController, string myName) { return new D`~classShortName~`(myController, myName); }`~
(withEntity ? `
auto `~classShortName~`(DOOPEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DAPPPageController myController, DOOPEntity myEntity) { return new D`~classShortName~`(myController, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DOOPEntity[] myEntities) { return new D`~classShortName~`(myEntities); }
auto `~classShortName~`(DAPPPageController myController, DOOPEntity[] myEntities) { return new D`~classShortName~`(myController, myEntities); }
` : ``);

}
