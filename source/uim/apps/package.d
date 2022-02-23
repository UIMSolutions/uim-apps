/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
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
public import colored;

// uim libraries
public import uim.core;
public import uim.oop;
public import uim.html;
public import uim.bootstrap;
public import uim.javascript;
public import uim.entities;
public import uim.jsonbase;
public import uim.entitybase;

// Packages
public import uim.apps.applications;
public import uim.apps.consoles;
public import uim.apps.containers;
public import uim.apps.controllers;
public import uim.apps.controllers.validators;
public import uim.apps.events;
public import uim.apps.forms;
public import uim.apps.interfaces;
public import uim.apps.helpers;
public import uim.apps.javascripts;
public import uim.apps.layouts;
public import uim.apps.middlewares;
public import uim.apps.requests;
// public import uim.apps.scripts;
public import uim.apps.tests;
public import uim.apps.security;
public import uim.apps.sessions;
public import uim.apps.views;

// Modules
public import uim.apps.views.registry;
public import uim.apps.object_;

public import layouts.tabler;

enum CRUDModes { Create, Read, Update, Delete }

size_t appErrorPrefix = 100000; 
string[size_t] appErrorCodes; 

DAPPSession[string] appSessions;
DOOPEntity[size_t] entityPool;
DOOPEntity[][size_t] entitiesPool;

/* auto setDemoSession(UUID sessionID, string[string][UUID] sessions) {
  if (sessionID !in sessions) sessions[sessionID] = null;

  sessions[sessionID]["database"] = "demo";
  return sessions;
}
 */
Json toEntitySelect(STRINGAA data) {
  string eid = data.get("entity_id", data.get("id", ""));
  if (eid.empty) return Json(null);

  Json result = Json.emptyObject;
  result["id"] = eid;
  if ("versionNumber" in data) result["versionNumber"] = to!size_t(data["versionNumber"]);
  return result;
}

auto urlToSelect(STRINGAA data) {
    writeln("DATA -> ", data);
    Json result = Json.emptyObject;

    string eid = data.get("entity_id", data.get("id", ""));
    string ename = data.get("entity_name", data.get("name", ""));
    string enumber = data.get("entity_number", data.get("number", ""));

/*     if ((eid.length > 0) && (ename.length >0)) {
      auto id = Json.emptyObject; id["id"] = eid;
      auto name = Json.emptyObject; name["name"] = ename;
      result["$or"] = [id, name];
    } 
    else {
      if (eid.length > 0) result["id"] = eid;
      else if (ename.length > 0) result["name"] = ename;
    }    
 */    
    result["id"] = eid;
    if (enumber.length > 0) result["versionNumber"] = to!size_t(enumber);

    return result;
}

auto entityToData(DOOPEntity entity) {
    return [
        "id": entity.id.toString,
/*         "name": entity.name,
 */        "versionNumber": to!string(entity.versionNumber)];
}


string entityToUrl(DOOPEntity entity) {
    return "id=%s&name=%s&number=%s".format(entity.id, entity.name, entity.versionNumber);
}

string identityToUrl(STRINGAA data) {
    string[] result; 
    if ("id" in data) result ~= "id=%s".format(data["id"]);
/*     if ("name" in data) result ~= "name=%s".format(data["name"]);
 */    if ("number" in data) result ~= "number=%s".format(data["versionNumber"]);
    return result.join("&");
}

auto readTranslations(string file) {
  STRINGAA results;

  if (file.exists) {
    logInfo("INFO: Found translation file '"~file~"'");
    auto sw = std.datetime.stopwatch.StopWatch(std.datetime.stopwatch.AutoStart.yes);
    try {
      auto text = readText(file);
      foreach(line; text.lineSplitter.array) {
        auto pos = line.indexOf("=");
        if (pos > 0) {
          results[line[0..pos]] = line[pos+1..$];
        }
      }
      sw.stop();
      logInfo("INFO: Finished reading translation file after "~to!string(sw.peek.total!"usecs")~" usecs -> Read "~to!string(results.length)~" entries");
    }
    catch(Exception e) {
      logError("ERROR: "~e.msg);
    }
  }
  else {
    logWarn("WARNING: Translation file '"~file~"' not found.");
  }

  return results;
}

struct Config {
  // Defaults
  auto configFile = "config.json";
  auto name = "name";  
  auto mode = "debug";  
  auto httpMode = "OnlyHttp";
  // http
  ushort httpPort = 8080;
  auto httpAddresses = ["::1", "127.0.0.1"];
  auto httpLogFormat = "%h - %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-Agent}i\"";
  // https
  ushort httpsPort = 8181;
  auto httpsAddresses = ["::1", "127.0.0.1"];
  auto httpsLogFormat = "%h - %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-Agent}i\"";
  auto tlsChain = "";
  auto tlsPrivate = "";

  void readConfig(string file) {
    Json appConfig = Json.emptyObject;

    if (file.exists) {
      logInfo("INFO: Found translation file '"~file~"'");
      try {
        auto sw = std.datetime.stopwatch.StopWatch(std.datetime.stopwatch.AutoStart.yes);
        appConfig = parseJsonString(readText(file)); 

        foreach(kv; appConfig.byKeyValue) {
          switch(kv.key) {
            // Config general
            case "name": name = kv.value.get!string; break;
            case "mode": mode = kv.value.get!string; break;
            case "http_mode": httpMode = kv.value.get!string; break;
            // Config http
            case "http_port": httpPort = kv.value.get!ushort; break;
            case "http_addresses": httpAddresses = null;
              foreach(v; kv.value.get!(Json[])) httpAddresses ~= v.get!string; 
              break;
            case "http_logformat": httpLogFormat = kv.value.get!string; break;
            // Config https
            case "https_port": httpsPort = kv.value.get!ushort; break;
            case "https_addresses": httpsAddresses = null;
              foreach(v; kv.value.get!(Json[])) httpsAddresses ~= v.get!string; 
              break;
            case "https_logformat": httpsLogFormat = kv.value.get!string; break;
            case "tls_chain": tlsChain = kv.value.get!string; break;
            case "tls_private": tlsPrivate = kv.value.get!string; break;
            default: break;
          }
        }
        sw.stop();
        logInfo("INFO: Finished reading config file after "~to!string(sw.peek.total!"usecs")~ " usecs" );
      }
      catch(Exception e) {
        logError("ERROR: "~e.msg);
      }
    }
    else {
      logWarn("WARNING: Config file not found.");
    }
  }
} 

auto readOrCreateSession(HTTPServerRequest req, HTTPServerResponse res) {
  req.session = req.session ? req.session : res.startSession();
  return req.session;
}

// internal switch
void pageRedirect(HTTPServerResponse response, STRINGAA parameters, string path, bool useResponse = false) {
  if (useResponse) response.redirect(path);
  else parameters["redirect"] = path;
}

// Helper function to add Scriptcode in parameters["script"]
STRINGAA addToPageScript(STRINGAA parameters, string script) {
  parameters["script"] = parameters.get("script", "")~script;
  return parameters;
}

auto getValue(STRINGAA parameters, string[] keys, string defaultValue = "") {
  foreach(key; keys) if (key in parameters) return parameters[key];
  return defaultValue;
}

auto hasAnyKey(Json parameters, string[] keys...) {
  return hasAnyKey(parameters, keys);
}
auto hasAnyKey(Json parameters, string[] keys) {
  if (parameters ==  Json(null)) return false;
  foreach(key; keys) if (key in parameters) return true;
  return false;
}

auto hasAllKey(Json parameters, string[] keys...) {
  return hasAllKey(parameters, keys);
}
auto hasAllKey(Json parameters, string[] keys) {
  if (parameters == Json(null)) return false;
  foreach(key; keys) if (key !in parameters) return false;
  return true;
}

/* DAPPViewRegistry uimViewRegistry;
static this() {
  uimViewRegistry = APPViewRegistry;
} */


template APPParameter(string name) {
  const char[] APPParameter = `
string `~name~`() { 
  return parameter("`~name~`"); 
} 
O `~name~`(this O)(string newValue) { 
  this.parameter("`~name~`", newValue);
  return cast(O)this; 
}`;
}