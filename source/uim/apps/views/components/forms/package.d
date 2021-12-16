module uim.apps.views.components.forms;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.form;

// Packages
public import uim.apps.views.components.forms.bodies;
public import uim.apps.views.components.forms.entity;
public import uim.apps.views.components.forms.headers;
public import uim.apps.views.components.forms.groups;
public import uim.apps.views.components.forms.login;
public import uim.apps.views.components.forms.view;

// Modules
public import uim.apps.views.components.forms.create;
public import uim.apps.views.components.forms.delete_;
public import uim.apps.views.components.forms.list;
public import uim.apps.views.components.forms.login;


template APPFormCalls(string name, bool entity = true) {
  const char[] APPFormCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }`~
entity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPView myView, DOOPEntity myEntity) { return new D`~name~`(myView, myEntity); }
` : ``;
}

template APPFormComponentCalls(string name, bool entity = true) {
  const char[] APPFormComponentCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DAPPForm myForm) { return new D`~name~`(myForm); }`~
entity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPForm myForm, DOOPEntity myEntity) { return new D`~name~`(myForm, myEntity); }
` : ``;
}