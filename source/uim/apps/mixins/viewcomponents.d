module uim.apps.mixins.viewcomponents;

@safe:
import uim.apps;

template ViewComponentThis(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentThis = `
this() { super(); this.name = "`~classShortName~`"; }
this(DBaseView newOwner) { this().owner(newOwner); }`~
(withEntity ? `
this(DOOPEntity newEntity) { this().entity(newEntity); }
this(DBaseView newOwner, DOOPEntity newEntity) { this(newOwner).entity(newEntity); }
` : ``)~
(withEntities ? `
this(DOOPEntity[] newEntities) { this().entities(newEntities); }
this(DBaseView newOwner, DOOPEntity[] newEntities) { this(newOwner).entities(newEntities); }
` : ``);

}

template ViewComponentCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DBaseView newOwner) { return new D`~classShortName~`(newOwner); }`~
(withEntity ? `
auto `~classShortName~`(DOOPEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DBaseView newOwner, DOOPEntity myEntity) { return new D`~classShortName~`(newOwner, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DOOPEntity[] newEntities) { return new D`~classShortName~`(newEntities); }
auto `~classShortName~`(DBaseView newOwner, DOOPEntity[] newEntities) { return new D`~classShortName~`(newOwner, newEntities); }
` : ``);
}

template OViewComponent(string id) {
  const char[] OViewComponent = `
    DViewComponent `~id~`() { return this.components["`~id~`"]; }
    O `~id~`(this O)(DViewComponent newComponent) { 
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
    DViewComponent `~name~`() { return this.components["`~id~`"]; }
    O `~name~`(this O)(DViewComponent newComponent) { 
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
