module uim.apps.views.components.forms.components.groups;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.forms.components.groups.group;

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

template APPFormGroupThis() {
  const char[] APPFormGroupThis = `
this() { super(); }
this(DAPPForm myForm) { this().form(myForm); };
`;
}

template APPFormGroupCalls(string name) {
  const char[] APPFormGroupCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPForm myForm) { return new D`~name~`(myForm); };
`;
}