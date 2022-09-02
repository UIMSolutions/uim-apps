module uim.apps.mixins.views;

@safe:
import uim.apps;

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

template ViewThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] ViewThis = appViewThis(name, withEntity, withEntities);
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

template ViewCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewCalls = appViewCalls(classShortName, withEntity, withEntities);
}

void testView(DView view) {
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

/* template ViewProperty(string dataType, string name) {
  const char[] ViewProperty = `
  `~dataType~` `~name~`() { return cast(`~dataType~`)this.component("`~name~`"); }
  O `~name~`(this O)(`~dataType~` newComponent) { this.component("`~name~`", newComponent); return cast(O)this; }
  `;
} */

template ViewProperty(string dataType, string name) {
  const char[] ViewProperty = `
  protected `~dataType~` _`~name~`;
  `~dataType~` `~name~`() { return _`~name~`; }
  O `~name~`(this O)(`~dataType~` newComponent) { _`~name~` = newComponent; return cast(O)this; }
  `;
}