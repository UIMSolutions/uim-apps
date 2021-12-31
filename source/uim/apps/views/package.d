module uim.apps.views;

@safe:
import uim.apps;

// Main
public import uim.apps.views.view;
public import uim.apps.views.list;

// Packages
public import uim.apps.views.components;
public import uim.apps.views.entities;
public import uim.apps.views.pages;

// pageses
public import uim.apps.views.block;
public import uim.apps.views.login;
public import uim.apps.views.login2;
public import uim.apps.views.logout;
public import uim.apps.views.lostaccount;
public import uim.apps.views.lostpw;
public import uim.apps.views.registry;
public import uim.apps.views.sites;

enum ViewModes { HTML, JS, XML }

template APPViewThis(string name) {
  const char[] APPViewThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPPageController myController) { this().controller(myController); }
`;
}

template APPViewCalls(string name) {
  const char[] APPViewCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPPageController myController) { return new D`~name~`(myController); }
`;
}
