module uim.apps.controllers;

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.controller;

// packages
public import uim.apps.controllers.actions;
public import uim.apps.controllers.creators;
public import uim.apps.controllers.components;
public import uim.apps.controllers.entities;
public import uim.apps.controllers.pages;
public import uim.apps.controllers.scripts;
public import uim.apps.controllers.styles;
public import uim.apps.controllers.validators;
public import uim.apps.controllers.middlewareoptions;

// modules
public import uim.apps.controllers.security;
public import uim.apps.controllers.registry;

template APPControllerThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPControllerThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPApplication myApplication, DOOPEntity myEntity) { this(myApplication).entity(myEntity); }
this(string myName, DOOPEntity myEntity) { this(myName).entity(myEntity); }
this(DAPPApplication myApplication, string myName, DOOPEntity myEntity) { this(myApplication, myName).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DAPPApplication myApplication, DOOPEntity[] myEntities) { this(myApplication).entities(myEntities); }
this(string myName, DOOPEntity[] myEntities) { this(myName).entities(myEntities); }
this(DAPPApplication myApplication, string myName, DOOPEntity[] myEntities) { this(myApplication, myName).entities(myEntities); }
` : ``);
}

template APPControllerCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPControllerCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPApplication myApplication) { return new D`~name~`(myApplication); }
`~
(withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPApplication myApplication, DOOPEntity myEntity) { return new D`~name~`(myApplication, myEntity); }
auto `~name~`(string myName, DOOPEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DAPPApplication myApplication, string myName, DOOPEntity myEntity) { return new D`~name~`(myApplication, myName, myEntity); }
` : ``)
~
(withEntities ? `
auto `~name~`(DOOPEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DAPPApplication myApplication, DOOPEntity[] myEntities) { return new D`~name~`(myApplication, myEntities); }
auto `~name~`(string myName, DOOPEntity[] myEntities) { return new D`~name~`(myName, myEntities); }
auto `~name~`(DAPPApplication myApplication, string myName, DOOPEntity[] myEntities) { return new D`~name~`(myApplication, myName, myEntities); }
` : ``);
}

void testController(DAPPController controller) {
	assert(controller);	

	controller["id"] = "testId1";
	writeln(controller.id);
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

	controller["mimetype"] = "testMimetype1";
	assert(controller.mimetype == "testMimetype1");	
	assert(controller["mimetype"] == "testMimetype1");	

	controller.mimetype("testMimetype2");
	assert(controller.mimetype("testMimetype2").mimetype == "testMimetype2");	
	assert(controller.mimetype("testMimetype2")["mimetype"] == "testMimetype2");			
}