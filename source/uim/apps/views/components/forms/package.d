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
public import uim.apps.views.components.forms.login2;


template APPFormThis(string name, bool withEntity = false) {
  const char[] APPFormThis = `
this() { super(); this.name("`~name~`"); initialize; }
this(DAPPView myView) { this().view(myView); }
this(string myName) { this().name(myName); }
this(DAPPView myView, string myName) { this(myView).name(myName); }`
~
(withEntity ? `
this(DOOPEntity myEntity) { this().entity(myEntity); }
this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
this(string myName, DOOPEntity myEntity) { this(myName).entity(myEntity); }
this(DAPPView myView, string myName, DOOPEntity myEntity) { this(myView, myName).entity(myEntity); }
` : ``);
}

template APPFormCalls(string name, bool withEntity = false) {
  const char[] APPFormCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }
auto `~name~`(string myName) { return new D`~name~`(myName); }
auto `~name~`(DAPPView myView, string myName) { return new D`~name~`(myView, myName); }`
~
(withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPView myView, DOOPEntity myEntity) { return new D`~name~`(myView, myEntity); }
auto `~name~`(string myName, DOOPEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DAPPView myView, string myName, DOOPEntity myEntity) { return new D`~name~`(myView, myName, myEntity); }
` : ``);
}

