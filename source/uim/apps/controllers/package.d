module uim.apps.controllers;

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.controller;
public import uim.apps.controllers.object_;

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

string appControllerThis(string name, bool withEntity = false, bool withEntities = false) {
  return `
this() { super(); this.name("`~name~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(DAPPApplication myApplication, DEntity myEntity) { this(myApplication).entity(myEntity); }
this(string myName, DEntity myEntity) { this(myName).entity(myEntity); }
this(DAPPApplication myApplication, string myName, DEntity myEntity) { this(myApplication, myName).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(DAPPApplication myApplication, DEntity[] myEntities) { this(myApplication).entities(myEntities); }
this(string myName, DEntity[] myEntities) { this(myName).entities(myEntities); }
this(DAPPApplication myApplication, string myName, DEntity[] myEntities) { this(myApplication, myName).entities(myEntities); }
` : ``);
}

template ControllerThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] ControllerThis = appControllerThis(name, withEntity, withEntities);
}

string appControllerCalls(string name, bool withEntity = false, bool withEntities = false) {
  return `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPApplication myApplication) { return new D`~name~`(myApplication); }
`~
(withEntity ? `
auto `~name~`(DEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPApplication myApplication, DEntity myEntity) { return new D`~name~`(myApplication, myEntity); }
auto `~name~`(string myName, DEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DAPPApplication myApplication, string myName, DEntity myEntity) { return new D`~name~`(myApplication, myName, myEntity); }
` : ``)
~
(withEntities ? `
auto `~name~`(DEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DAPPApplication myApplication, DEntity[] myEntities) { return new D`~name~`(myApplication, myEntities); }
auto `~name~`(string myName, DEntity[] myEntities) { return new D`~name~`(myName, myEntities); }
auto `~name~`(DAPPApplication myApplication, string myName, DEntity[] myEntities) { return new D`~name~`(myApplication, myName, myEntities); }
` : ``);
}

template ControllerCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] ControllerCalls = appControllerCalls(name, withEntity, withEntities);
}

void testController(DController controller) {
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