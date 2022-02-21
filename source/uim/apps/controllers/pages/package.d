module uim.apps.controllers.pages;
/**************************************************/
/* This package contains general page definitions */
/**************************************************/

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.pages.controller;
public import uim.apps.controllers.pages.entities;
public import uim.apps.controllers.pages.entity;

//Packages
public import uim.apps.controllers.pages.crud;

// Modules
public import uim.apps.controllers.pages.apps;
public import uim.apps.controllers.pages.error;
public import uim.apps.controllers.pages.login;
public import uim.apps.controllers.pages.login2;
public import uim.apps.controllers.pages.logout;
public import uim.apps.controllers.pages.lostaccount;
public import uim.apps.controllers.pages.lostpw;
public import uim.apps.controllers.pages.helpers;
public import uim.apps.controllers.pages.register;
public import uim.apps.controllers.pages.sites;

template APPPageControllerThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPPageControllerThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
this(DAPPView myView) { this().view(myView); }
this(DAPPApplication myApplication, DAPPView myView) { this().view(myView); }
`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPApplication myApplication, DOOPEntity myEntity) { this(myApplication).entity(myEntity); }
this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
this(DAPPApplication myApplication, DAPPView myView, DOOPEntity myEntity) { this(myApplication, myView).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DAPPApplication myApplication, DOOPEntity[] myEntities) { this(myApplication).entities(myEntities); }
this(DAPPView myView, DOOPEntity[] myEntities) { this(myView).entities(myEntities); }
this(DAPPApplication myApplication, DAPPView myView, DOOPEntity[] myEntities) { this(myApplication, myView).entities(myEntities); }
` : ``);
}
template APPPageControllerCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPPageControllerCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPApplication myApplication) { return new D`~name~`(myApplication); }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }
auto `~name~`(DAPPApplication myApplication, DAPPView myView) { return new D`~name~`(myApplication, myView); }
`~
(withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPApplication myApplication, DOOPEntity myEntity) { return new D`~name~`(myApplication, myEntity); }
auto `~name~`(DAPPView myView, DOOPEntity myEntity) { return new D`~name~`(myView, myEntity); }
auto `~name~`is(DAPPApplication myApplication, DAPPView myView, DOOPEntity myEntity) { return new D`~name~`(myApplication, myView, myEntity); }
` : ``)
~
(withEntities ? `
auto `~name~`(DOOPEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DAPPApplication myApplication, DOOPEntity[] myEntities) { return new D`~name~`(myApplication, myEntities); }
auto `~name~`(DAPPView myView, DOOPEntity[] myEntities) { return new D`~name~`(myView, myEntities); }
auto `~name~`(DAPPApplication myApplication, DAPPView myView, DOOPEntity[] myEntities) { return new D`~name~`(myApplication, myView, myEntities); }
` : ``);
}

// Get page by names
DAPPPageController pageByName(DAPPController[] controllers, string name) {
	foreach(controller; controllers) {
		if (auto page = cast(DAPPPageController)controller) { return page; }
	}
	return null; 
}