module uim.apps.views.components.forms;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.form;

// Packages
public import uim.apps.views.components.forms.components;
public import uim.apps.views.components.forms.entities;

// Modules
public import uim.apps.views.components.forms.login;
public import uim.apps.views.components.forms.login;

template APPFormCalls(string name) {
  const char[] APPFormCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }`;
}

template APPFormThis(string name) {
  const char[] APPFormCThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPView myView) { this().view(myView); }`;
}

template APPFormComponentThis(string name) {
  const char[] APPFormComponentThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPForm myForm) { this().form(myForm); }`;
}

template APPFormComponentCalls(string name) {
  const char[] APPFormComponentCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DAPPForm myForm) { return new D`~name~`(myForm); }`;
}

