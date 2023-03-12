module uim.apps.mixins.viewcomponents;

@safe:
import uim.apps;

template ViewComponentThis(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentThis = `
this() { super(); this.name = "`~classShortName~`"; }
this(DView newView) { this().view(newView); }`~
(withEntity ? `
this(DEntity newEntity) { this().entity(newEntity); }
this(DView newView, DEntity newEntity) { this(newView).entity(newEntity); }
` : ``)~
(withEntities ? `
this(DEntity[] newEntities) { this().entities(newEntities); }
this(DView newView, DEntity[] newEntities) { this(newView).entities(newEntities); }
` : ``);

}

template ViewComponentCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DView newView) { return new D`~classShortName~`(newView); }`~
(withEntity ? `
auto `~classShortName~`(DEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DView newView, DEntity myEntity) { return new D`~classShortName~`(newView, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DEntity[] newEntities) { return new D`~classShortName~`(newEntities); }
auto `~classShortName~`(DView newView, DEntity[] newEntities) { return new D`~classShortName~`(newView, newEntities); }
` : ``);
}

