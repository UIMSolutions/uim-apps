module uim.apps.helpers.app;

import uim.apps;

@safe:
string correctAppPath(string aPath) {
  auto appPath = aPath.strip;

  if (appPath.length == 0) appPath = "/"; 
  if (appPath.length > 0) {
    if (appPath[0] != '/') appPath = "/"~appPath; 
    if (appPath[$-1] != '/') appPath = appPath~"/"; 
  }
  return appPath;
}