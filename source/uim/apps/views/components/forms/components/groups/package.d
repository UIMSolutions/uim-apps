module uim.apps.views.components.forms.components.groups;

@safe:
import uim.apps;

// Main
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
template APPFormGroupThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPFormGroupThis = `
this() { super(); }
this(DAPPForm myForm) { this().form(myForm); };
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

template APPFormGroupCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] APPFormGroupCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPForm myForm) { return new D`~name~`(myForm); };
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