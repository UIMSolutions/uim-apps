/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.apps.classes.apps.app;

import uim.apps;
@safe:

class DApp : DApplication { 
  this() { super(); }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .className("App")
      .registerPath(className.toLower);
  }

  // #region Request Handling
    override void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
      request(newRequest, newResponse, null); 
    }

    override void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options) {
      debugMethodCall(moduleName!DApp~":DApp("~this.name~")::request(req, res, requestParameters)");

      writeln("rootPath = '%s'".format(this.rootPath));
      writeln("newRequest.fullURL = '%s'".format(newRequest.fullURL));
      writeln("newRequest.rootDir = '%s'".format(newRequest.rootDir));
      writeln("newRequest.path    = '%s'".format(newRequest.path));
      writeln("newRequest.path.length = '%s'".format(newRequest.path.length));

      if ("path" in options) {
        writeln("New path = '%s'".format(options["path"]));
      } else  writeln("No path");

      writeln(routesPaths);
      auto myPath = rootPath.length > 0 ? newRequest.path[rootPath.length..$] : newRequest.path;
      writeln("myPath = '%s'".format(myPath));
      if (auto myRoute = route(myPath, newRequest.method)) {
        debug writeln("Found route");

        myRoute.controller.request(newRequest, newResponse, options);
      }
      else {
        foreach(myApp; apps) {
          if (myApp && (myPath >= myApp.rootPath) && (myPath.indexOf(myApp.rootPath) == 0)) {
            debug writeln("Found App %s".format(myApp.name));
            myApp.request(newRequest, newResponse, options);
          }
        }
      }
    }
  // #endregion 
}
auto Application() { return new DApplication; }

unittest {
  assert(
    Application
      .addRoute(Route("ecm/index", HTTPMethod.GET, PageController))
      .addRoute(Route("ecm/documents", HTTPMethod.GET, PageController))
      .addRoute(Route("ecm/folders", HTTPMethod.GET, PageController))
      .addRoute(Route("ecm/workspaces", HTTPMethod.GET, PageController))
  );
}
