module uim.apps.views.components.forms.components.groups;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.components.groups.entity;
public import uim.apps.views.components.forms.components.groups.group;
public import uim.apps.views.components.forms.components.groups.handler;

// Modules
public import uim.apps.views.components.forms.components.groups.checkbox;
public import uim.apps.views.components.forms.components.groups.description;
public import uim.apps.views.components.forms.components.groups.date;
public import uim.apps.views.components.forms.components.groups.display;
public import uim.apps.views.components.forms.components.groups.name;
public import uim.apps.views.components.forms.components.groups.startenddate;
public import uim.apps.views.components.forms.components.groups.switch_;
public import uim.apps.views.components.forms.components.groups.text;
public import uim.apps.views.components.forms.components.groups.textarea;

// for tests
public import uim.apps.views.components.forms.components.groups.tests;

// Mixins
template FormGroupThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormGroupThis = `
this() { super(); }
this(DForm myForm) { this().form(myForm); };
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

template FormGroupCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormGroupCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DForm myForm) { return new D`~name~`(myForm); };
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