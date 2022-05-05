module uim.apps.views.components.forms.components.inputs;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.components.inputs.entity;
public import uim.apps.views.components.forms.components.inputs.input;
public import uim.apps.views.components.forms.components.inputs.handler;

// Modules
public import uim.apps.views.components.forms.components.inputs.checkbox;
public import uim.apps.views.components.forms.components.inputs.description;
public import uim.apps.views.components.forms.components.inputs.date;
public import uim.apps.views.components.forms.components.inputs.display;
public import uim.apps.views.components.forms.components.inputs.name;
public import uim.apps.views.components.forms.components.inputs.startenddate;
public import uim.apps.views.components.forms.components.inputs.switch_;
public import uim.apps.views.components.forms.components.inputs.text;
public import uim.apps.views.components.forms.components.inputs.textarea;

// for tests
public import uim.apps.views.components.forms.components.inputs.tests;

// Mixins
template FormInputThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormInputThis = `
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

template FormInputCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormInputCalls = `
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