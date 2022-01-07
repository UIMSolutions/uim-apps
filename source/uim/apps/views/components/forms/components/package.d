module uim.apps.views.components.forms.components;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.components.component;

// Packages
public import uim.apps.views.components.forms.components.bodies;
public import uim.apps.views.components.forms.components.groups;
public import uim.apps.views.components.forms.components.headers;
public import uim.apps.views.components.forms.components.footers;

template APPFormComponentThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPFormComponentThis = `
this() { super(); this.name("`~name~`"); initialize; }
this(DAPPForm myForm) { this().form(myForm); }
this(string myName) { this().name(myName); }
this(DAPPForm myForm, string myName) { this(myForm).name(myName); }
`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
this(string myName, DOOPEntity myEntity) { this(myName).entity(myEntity); }
this(DAPPForm myForm, string myName, DOOPEntity myEntity) { this(myForm, myName).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DAPPForm myForm, DOOPEntity[] myEntities) { this(myForm).entities(myEntities); }
this(string myName, DOOPEntity[] myEntities) { this(myName).entities(myEntities); }
this(DAPPForm myForm, string myName, DOOPEntity[] myEntities) { this(myForm, myName).entities(myEntities); }
` : ``);
}

template APPFormComponentCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPFormComponentCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DAPPForm myForm) { return new D`~name~`(myForm); }
auto `~name~`(string myName) { return new D`~name~`(myName); }
auto `~name~`(DAPPForm myForm, string myName) { return new D`~name~`(myForm, myName); }`
~
(withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPForm myForm, DOOPEntity myEntity) { return new D`~name~`(myForm, myEntity); }
auto `~name~`(string myName, DOOPEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DAPPForm myForm, string myName, DOOPEntity myEntity) { return new D`~name~`(myForm, myName, myEntity); }
` : ``)
~
(withEntities ? `
auto `~name~`(DOOPEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DAPPForm myForm, DOOPEntity[] myEntities) { return new D`~name~`(myForm, myEntities); }
auto `~name~`(string myName, DOOPEntity[] myEntities) { return new D`~name~`(myName, myEntities); }
auto `~name~`(DAPPForm myForm, string myName, DOOPEntity[] myEntities) { return new D`~name~`(myForm, myName, myEntities); }
` : ``);
}