module uim.apps.views;

@safe:
import uim.apps;

// Main
public import uim.apps.views.object_;
public import uim.apps.views.view;
public import uim.apps.views.list;

// Packages
public import uim.apps.views.components;
public import uim.apps.views.crud;

// pageses
public import uim.apps.views.block;
public import uim.apps.views.block;
public import uim.apps.views.login;
public import uim.apps.views.login2;
public import uim.apps.views.logout;
public import uim.apps.views.lostaccount;
public import uim.apps.views.lostpw;
public import uim.apps.views.registry;
public import uim.apps.views.sites;

enum ViewModes { HTML, JS, XML }

string appViewThis(string name, bool withEntity = false, bool withEntities = false) {
  return `
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

}

template APPViewThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPViewThis = appViewThis(name, withEntity, withEntities);
}

string appViewCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  return `
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

template APPViewCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] APPViewCalls = appViewCalls(classShortName, withEntity, withEntities);
}

void testView(DAPPView view) {
	assert(view);	

	view["id"] = "testId1";
	assert(view.id == "testId1");	
	assert(view["id"] == "testId1");	

	view.id("testId2");
	assert(view.id("testId2").id == "testId2");	
	assert(view.id("testId2")["id"] == "testId2");	

	view["name"] = "testName1";
	assert(view.name == "testName1");	
	assert(view["name"] == "testName1");	

	view.name("testName2");
	assert(view.name("testName2").name == "testName2");	
	assert(view.name("testName2")["name"] == "testName2");	
}

string appActionView(string category, string className, string action, string initialize = "", string beforeH5 = "") {
  string viewName = category~className~action~"View";

  return `
class D`~viewName~` : DAPPEntity`~action~`View {
  `~appViewThis(viewName, true)~`

  override void initialize() {
    debugMethodCall(moduleName!D`~viewName~`~"::D`~viewName~`("~this.name~"):initialize");   
    super.initialize;
    `~initialize~`
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!D`~viewName~`~"::D`~viewName~`:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }	
    `~beforeH5~`
  }
}
`~appViewCalls(viewName, true);
}

template APPActionView(string category, string className, string action, string initialize = "", string beforeH5 = "") {
  const char[] APPActionView = appActionView(category, className, action, initialize, beforeH5);
}