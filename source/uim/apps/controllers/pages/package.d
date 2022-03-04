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

string appPageControllerThis(string controllerName, bool withEntity = false, bool withEntities = false) {
	return `
this() { super(); this.name("`~controllerName~`"); }
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

template APPPageControllerThis(string controllerName, bool withEntity = false, bool withEntities = false) {
  const char[] APPPageControllerThis = appPageControllerThis(controllerName, withEntity, withEntities);
}

string appPageControllerCalls(string controllerName, bool withEntity = false, bool withEntities = false) {
	return `
auto `~controllerName~`() { return new D`~controllerName~`; }
auto `~controllerName~`(DAPPApplication myApplication) { return new D`~controllerName~`(myApplication); }
auto `~controllerName~`(DAPPView myView) { return new D`~controllerName~`(myView); }
auto `~controllerName~`(DAPPApplication myApplication, DAPPView myView) { return new D`~controllerName~`(myApplication, myView); }
`~
(withEntity ? `
auto `~controllerName~`(DOOPEntity myEntity) { return new D`~controllerName~`(myEntity); }
auto `~controllerName~`(DAPPApplication myApplication, DOOPEntity myEntity) { return new D`~controllerName~`(myApplication, myEntity); }
auto `~controllerName~`(DAPPView myView, DOOPEntity myEntity) { return new D`~controllerName~`(myView, myEntity); }
auto `~controllerName~`is(DAPPApplication myApplication, DAPPView myView, DOOPEntity myEntity) { return new D`~controllerName~`(myApplication, myView, myEntity); }
` : ``)
~
(withEntities ? `
auto `~controllerName~`(DOOPEntity[] myEntities) { return new D`~controllerName~`(myEntities); }
auto `~controllerName~`(DAPPApplication myApplication, DOOPEntity[] myEntities) { return new D`~controllerName~`(myApplication, myEntities); }
auto `~controllerName~`(DAPPView myView, DOOPEntity[] myEntities) { return new D`~controllerName~`(myView, myEntities); }
auto `~controllerName~`(DAPPApplication myApplication, DAPPView myView, DOOPEntity[] myEntities) { return new D`~controllerName~`(myApplication, myView, myEntities); }
` : ``);
}

template APPPageControllerCalls(string controllerName, bool withEntity = false, bool withEntities = false) {
  const char[] APPPageControllerCalls = appPageControllerCalls(controllerName, withEntity, withEntities); 
}

// Get page by names
DAPPPageController pageByName(DAPPController[] controllers, string name) {
	foreach(controller; controllers) {
		if (auto page = cast(DAPPPageController)controller) { return page; }
	}
	return null; 
}

void testPageController(DAPPPageController controller) {
	assert(controller);	

	controller["id"] = "testId1";
	assert(controller.id == "testId1");	
	assert(controller["id"] == "testId1");	

	controller.id("testId2");
	assert(controller.id("testId2").id == "testId2");	
	assert(controller.id("testId2")["id"] == "testId2");	

	controller["name"] = "testName1";
	assert(controller.name == "testName1");	
	assert(controller["name"] == "testName1");	

	controller.name("testName2");
	assert(controller.name("testName2").name == "testName2");	
	assert(controller.name("testName2")["name"] == "testName2");	

	assert(controller.mimetype == "text/html");	

	controller["mimetype"] = "testMimetype1";
	assert(controller.mimetype == "testMimetype1");	
	assert(controller["mimetype"] == "testMimetype1");	

	controller.mimetype("testMimetype2");
	assert(controller.mimetype("testMimetype2").mimetype == "testMimetype2");	
	assert(controller.mimetype("testMimetype2")["mimetype"] == "testMimetype2");			

	assert(controller.view(APPView).view.name == "APPView", "Found error"); 
	assert(controller.view(APPView).view["name"] == "APPView", "Found error"); 
}