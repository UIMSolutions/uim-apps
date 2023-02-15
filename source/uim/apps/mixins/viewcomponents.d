module uim.apps.mixins.viewcomponents;

@safe:
import uim.apps;

template ViewComponentThis(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentThis = `
this() { super(); this.name = "`~classShortName~`"; }
this(DAPPView newView) { this().view(newView); }`~
(withEntity ? `
this(DEntity newEntity) { this().entity(newEntity); }
this(DAPPView newView, DEntity newEntity) { this(newView).entity(newEntity); }
` : ``)~
(withEntities ? `
this(DEntity[] newEntities) { this().entities(newEntities); }
this(DAPPView newView, DEntity[] newEntities) { this(newView).entities(newEntities); }
` : ``);

}

template ViewComponentCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DAPPView newView) { return new D`~classShortName~`(newView); }`~
(withEntity ? `
auto `~classShortName~`(DEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DAPPView newView, DEntity myEntity) { return new D`~classShortName~`(newView, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DEntity[] newEntities) { return new D`~classShortName~`(newEntities); }
auto `~classShortName~`(DAPPView newView, DEntity[] newEntities) { return new D`~classShortName~`(newView, newEntities); }
` : ``);
}

template OViewComponent(string id) {
  const char[] OViewComponent = `
    DAPPViewComponent `~id~`() { return this.components["`~id~`"]; }
    O `~id~`(this O)(DAPPViewComponent newComponent) { 
      _beforeSet`~id.capitalize~`;
      this.components.set("`~id~`", newComponent);
      _afterSet`~id.capitalize~`; 
      return cast(O)this; }
    void _beforeSet`~id.capitalize~`() {}
    void _afterSet`~id.capitalize~`() {}
  `;
}

template OViewComponent(string id, string name) {
  const char[] OViewComponent = `
    DAPPViewComponent `~name~`() { return this.components["`~id~`"]; }
    O `~name~`(this O)(DAPPViewComponent newComponent) { 
      _beforeSet`~name.capitalize~`;
      this.components.set("`~id~`", newComponent); 
      _afterSet`~name.capitalize~`; 
      return cast(O)this; }
    void _beforeSet`~name.capitalize~`() {}
    void _afterSet`~name.capitalize~`() {}
  `;
}

template OViewComponent(string id, string name, string type) {
  const char[] OViewComponent = `
    `~type~` `~name~`() { return cast(`~type~`)this.components["`~id~`"]; }
    O `~name~`(this O)(`~type~` newComponent) { 
      beforeSet`~name.capitalize~`;
      this.components.set("`~id~`", newComponent); 
      afterSet`~name.capitalize~`; 
      return cast(O)this; }
    void beforeSet`~name.capitalize~`() {}
    void afterSet`~name.capitalize~`() {}
  `;
}
