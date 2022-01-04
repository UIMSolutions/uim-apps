module uim.apps.controllers.pages;
/**************************************************/
/* This package contains general page definitions */
/**************************************************/

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.pages.controller;

//Packages
public import uim.apps.controllers.pages.entities;

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

template APPPageThis(string name) {
  const char[] APPPageThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
this(DAPPView myView) { this().view(myView); }
this(DAPPApplication myApplication, DAPPView myView) { this().view(myView); }
`;
}

template APPPageCalls(string name) {
  const char[] APPPageCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPApplication myApplication) { return new D`~name~`(myApplication); }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }
auto `~name~`(DAPPApplication myApplication, DAPPView myView) { return new D`~name~`(myApplication, myView); }
`;
}

// Get page by names
DAPPPageController pageByName(DAPPController[] controllers, string name) {
	foreach(controller; controllers) {
		if (auto page = cast(DAPPPageController)controller) { return page; }
	}
	return null; 
}