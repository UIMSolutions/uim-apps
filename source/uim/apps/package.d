/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)			                                       * 
* Docu: https://www.sicherheitsschmiede.de/projects/package/uim_apps					                                         * 
***********************************************************************************************************************/
module uim.apps;

@safe:

/// Phobos libraries
public import std.datetime;
public import std.datetime.stopwatch;
public import std.digest.sha;
public import std.stdio;
public import std.string;
public import std.file;
public import std.uuid;

/// External libraries
// public import colored;
public import vibe.d;

// uim libraries
public import uim.core;
public import uim.oop;
public import uim.html;
public import uim.bootstrap;
public import uim.javascript;
public import uim.jsonbase;
public import uim.entitybase;
public import uim.servers;
public import uim.controls;
public import uim.mvc;

// Packages
public import uim.apps.applications;
public import uim.apps.controllers;
public import uim.apps.controllers.validators;
public import uim.apps.forms;
public import uim.apps.layouts;
// public import uim.apps.middlewares;
public import uim.apps.mixins;
// public import uim.apps.scripts;
public import uim.apps.views;

// Modules
public import uim.apps.object_;

public import layouts.tabler;



/* auto setDemoSession(UUID sessionID, string[string][UUID] sessions) {
  if (sessionID !in sessions) sessions[sessionID] = null;

  sessions[sessionID]["database"] = "demo";
  return sessions;
}
 */
