module uim.apps.mixins.actions;

@safe:
import uim.apps;

string appActionView(string category, string className, string action, string initialize = "", string beforeH5 = "") {
  string viewName = category~className~action~"View";

  return `
class D`~viewName~` : DAPPEntity`~action~`View {
  `~appViewThis(viewName, true)~`

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
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