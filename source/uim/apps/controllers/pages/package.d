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

// Get page by names
DAPPPageController pageByName(DController[] controllers, string name) {
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

auto appCreatePageController(string category, string className, string rootController, string collectionName, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~category~className~`CreatePageController : D`~category~`CreatePageController {
      `~appPageControllerThis(category~className~`CreatePageController`, true)~`

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
      super.initialize;

      this.view(
        `~category~className~`CreateView(this));
      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(category~className~`CreatePageController`, true);
}