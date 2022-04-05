module uim.apps.mixins.viewcomponents;

@safe:
import uim.apps;

template ViewComponentThis(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentThis = `
this() { super(); this.name = "`~classShortName~`"; }
this(DAPPView myView) { this().view(myView); }`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
` : ``)~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DAPPView myView, DOOPEntity[] myEntities) { this(myView).entities(myEntities); }
` : ``);

}

template ViewComponentCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DAPPView myView) { return new D`~classShortName~`(myView); }`~
(withEntity ? `
auto `~classShortName~`(DOOPEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DAPPView myView, DOOPEntity myEntity) { return new D`~classShortName~`(myView, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DOOPEntity[] myEntities) { return new D`~classShortName~`(myEntities); }
auto `~classShortName~`(DAPPView myView, DOOPEntity[] myEntities) { return new D`~classShortName~`(myView, myEntities); }
` : ``);
}

template OViewComponent(string id) {
  const char[] OViewComponent = `
    DViewComponent `~id~`() { return this.components["`~id~`"]; }
    O `~id~`(this O)(DViewComponent newComponent) { 
      this.components.add("`~id~`", newComponent); 
      return cast(O)this; }
  `;
}

template OViewComponent(string id, string name) {
  const char[] OViewComponent = `
    DViewComponent `~name~`() { return this.components["`~id~`"]; }
    O `~name~`(this O)(DViewComponent newComponent) { 
      this.components.add("`~id~`", newComponent); 
      return cast(O)this; }
  `;
}

template OViewComponent(string id, string name, string type) {
  const char[] OViewComponent = `
    `~type~` `~name~`() { return cast(`~type~`)this.components["`~id~`"]; }
    O `~name~`(this O)(`~type~` newComponent) { 
      this.components["`~id~`"] = newComponent; 
      return cast(O)this; }
  `;
}
