module uim.apps.controllers;

@safe:
import uim.apps;

// Main
public import uim.apps.controllers.controller;

// packages
public import uim.apps.controllers.actions;
public import uim.apps.controllers.creators;
public import uim.apps.controllers.components;
public import uim.apps.controllers.entities;
public import uim.apps.controllers.pages;
public import uim.apps.controllers.scripts;
public import uim.apps.controllers.styles;
public import uim.apps.controllers.validators;
public import uim.apps.controllers.middlewareoptions;

// modules
public import uim.apps.controllers.security;
public import uim.apps.controllers.registry;

template APPControllerThis(string name) {
  const char[] APPControllerThis = `
this() { super(); this.name("`~name~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
`;
}

template APPControllerCalls(string name) {
  const char[] APPControllerCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DAPPApplication myApplication) { return new D`~name~`(myApplication); }
`;
}
