module uim.apps.views.components.forms.components;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.components.component;

// Packages
public import uim.apps.views.components.forms.components.contents; // the content of a form without header and footer
public import uim.apps.views.components.forms.components.groups;
public import uim.apps.views.components.forms.components.headers;
public import uim.apps.views.components.forms.components.footers;

template FormComponentThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormComponentThis = `
this() { super(); this.name("`~name~`"); }
this(DForm myForm) { this().form(myForm); }
this(string myName) { this().name(myName); }
this(DForm myForm, string myName) { this(myForm).name(myName); }
`~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
this(string myName, DOOPEntity myEntity) { this(myName).entity(myEntity); }
this(DForm myForm, string myName, DOOPEntity myEntity) { this(myForm, myName).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DOOPEntity[] myEntities) { this().entities(myEntities); }
this(DForm myForm, DOOPEntity[] myEntities) { this(myForm).entities(myEntities); }
this(string myName, DOOPEntity[] myEntities) { this(myName).entities(myEntities); }
this(DForm myForm, string myName, DOOPEntity[] myEntities) { this(myForm, myName).entities(myEntities); }
` : ``);
}

template FormComponentCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormComponentCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DForm myForm) { return new D`~name~`(myForm); }
auto `~name~`(string myName) { return new D`~name~`(myName); }
auto `~name~`(DForm myForm, string myName) { return new D`~name~`(myForm, myName); }`
~
(withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DForm myForm, DOOPEntity myEntity) { return new D`~name~`(myForm, myEntity); }
auto `~name~`(string myName, DOOPEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DForm myForm, string myName, DOOPEntity myEntity) { return new D`~name~`(myForm, myName, myEntity); }
` : ``)
~
(withEntities ? `
auto `~name~`(DOOPEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DForm myForm, DOOPEntity[] myEntities) { return new D`~name~`(myForm, myEntities); }
auto `~name~`(string myName, DOOPEntity[] myEntities) { return new D`~name~`(myName, myEntities); }
auto `~name~`(DForm myForm, string myName, DOOPEntity[] myEntities) { return new D`~name~`(myForm, myName, myEntities); }
` : ``);
}