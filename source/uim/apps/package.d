module uim.apps;

/// Phobos libraries
public import std.stdio;
public import std.string;
public import std.file;
public import std.uuid;

/// External libraries
public import vibe.d;

/// Internal libraries
public import uim.modules;

string[string][UUID] currentSession;

auto setDemoSession(UUID sessionID, string[string][UUID] sessions) {
  if (sessionID !in sessions) sessions[sessionID] = null;

  sessions[sessionID]["database"] = "demo";
  return sessions;
}