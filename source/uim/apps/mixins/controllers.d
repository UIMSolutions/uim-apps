module uim.apps.mixins.controllers;

@safe:
import uim.apps;

string appPageControllerThis(string controllerName, bool withEntity = false, bool withEntities = false) {
	return `
this() { super(); this.name("`~controllerName~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
this(DView myView) { this().view(myView); }
this(DAPPApplication myApplication, DView myView) { this().view(myView); }
`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(DAPPApplication myApplication, DEntity myEntity) { this(myApplication).entity(myEntity); }
this(DView myView, DEntity myEntity) { this(myView).entity(myEntity); }
this(DAPPApplication myApplication, DView myView, DEntity myEntity) { this(myApplication, myView).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(DAPPApplication myApplication, DEntity[] myEntities) { this(myApplication).entities(myEntities); }
this(DView myView, DEntity[] myEntities) { this(myView).entities(myEntities); }
this(DAPPApplication myApplication, DView myView, DEntity[] myEntities) { this(myApplication, myView).entities(myEntities); }
` : ``);
}

template PageControllerThis(string controllerName, bool withEntity = false, bool withEntities = false) {
  const char[] PageControllerThis = appPageControllerThis(controllerName, withEntity, withEntities);
}

string appPageControllerCalls(string controllerName, bool withEntity = false, bool withEntities = false) {
	return `
auto `~controllerName~`() { return new D`~controllerName~`; }
auto `~controllerName~`(DAPPApplication myApplication) { return new D`~controllerName~`(myApplication); }
auto `~controllerName~`(DView myView) { return new D`~controllerName~`(myView); }
auto `~controllerName~`(DAPPApplication myApplication, DView myView) { return new D`~controllerName~`(myApplication, myView); }
`~
(withEntity ? `
auto `~controllerName~`(DEntity myEntity) { return new D`~controllerName~`(myEntity); }
auto `~controllerName~`(DAPPApplication myApplication, DEntity myEntity) { return new D`~controllerName~`(myApplication, myEntity); }
auto `~controllerName~`(DView myView, DEntity myEntity) { return new D`~controllerName~`(myView, myEntity); }
auto `~controllerName~`is(DAPPApplication myApplication, DView myView, DEntity myEntity) { return new D`~controllerName~`(myApplication, myView, myEntity); }
` : ``)
~
(withEntities ? `
auto `~controllerName~`(DEntity[] myEntities) { return new D`~controllerName~`(myEntities); }
auto `~controllerName~`(DAPPApplication myApplication, DEntity[] myEntities) { return new D`~controllerName~`(myApplication, myEntities); }
auto `~controllerName~`(DView myView, DEntity[] myEntities) { return new D`~controllerName~`(myView, myEntities); }
auto `~controllerName~`(DAPPApplication myApplication, DView myView, DEntity[] myEntities) { return new D`~controllerName~`(myApplication, myView, myEntities); }
` : ``);
}

template PageControllerCalls(string controllerName, bool withEntity = false, bool withEntities = false) {
  const char[] PageControllerCalls = appPageControllerCalls(controllerName, withEntity, withEntities); 
}

auto appCreatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`CreatePageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`CreatePageController`, true)~`

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
      super.initialize;

      this
        .view(
          `~classesName~`CreateView(this));

      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(classesName~`CreatePageController`, true);
}


template APPCreatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] APPCreatePageController = appCreatePageController(classesName, rootController, addInitialize, addBeforeResponse);
}