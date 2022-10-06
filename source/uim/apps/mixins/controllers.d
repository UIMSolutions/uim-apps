module uim.apps.mixins.controllers;

@safe:
import uim.apps;

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

auto appCreatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`CreatePageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`CreatePageController`, true)~`

    override void initialize() {
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