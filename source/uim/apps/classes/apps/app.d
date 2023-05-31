/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.apps.classes.apps.app;

import uim.apps;
@safe:

class DApp : DApplication, IRequestHandler, IApp { 
  this() { super(); }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .className("App")
      .registerPath(className.toLower);
  }


// #region parameters
    mixin(MVCParameter!("rootPath"));
  // #endregion parameters

  // Application data 
  mixin(OProperty!("IServer", "server"));
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("size_t", "versionNumber"));

  // Interfaces
  mixin(OProperty!("DETBBase", "database"));
  mixin(OProperty!("DRoute[HTTPMethod][string]", "routes"));

  // Main Containers - Allways first
  mixin(OProperty!("DMVCLinkContainer",   "links"));
  mixin(OProperty!("DMVCMetaContainer",   "metas"));
  mixin(OProperty!("DScriptContainer", "scripts"));
  mixin(OProperty!("DStyleContainer",  "styles"));

  // View and Controllers
  // #region Managing controllers
    mixin(OProperty!("DController[string]",  "controllers"));
    bool hasController(string controllerName) {
      return (controllerName in _controllers ? true : false);
    }
    O addController(this O)(string controllerName, DController newController) {
      _controllers[controllerName] = newController;
      return cast(O)this;
    }
    DController getController(string controllerName) {
      return _controllers.get(controllerName, NullController);
    }
    O removeController(this O)(string controllerName) {
      _controllers.remove(controllerName);
      return cast(O)this;
    }
  // #endregion

  // #region Managing views
    mixin(OProperty!("DView[string]",  "views"));
    bool hasView(string viewName) {
      return (viewName in _views ? true : false);
    }
    O addView(this O)(string viewName, DView newView) {
      _views[viewName] = newView;
      return cast(O)this;
    }
    DView getView(string viewName) {
      return _views.get(viewName, NullView);
    }
    O removeView(this O)(string viewName) {
      _views.remove(viewName);
      return cast(O)this;
    }
  // #endregion

  protected ILayout _layout;
	@property O layout(this O)(ILayout newlayout) { 
    _layout = newlayout; 
    return cast(O)this; }
  
  ILayout layout() {
    debugMethodCall(moduleName!DApp~":DApp("~this.name~")::layout()");
    return _layout  ? _layout 
      : (server ? server.layout 
        : null);
  }
  
  auto routesPaths() {
    return _routes.keys; 
  }

  auto routesAtPath(string path) {
    debug writeln("Get routes at '%s'".format(path));
    return _routes.get(path, null); 
  }

  auto route(string path, HTTPMethod method) {
    debug writeln("Get route at '%s' and '%s'".format(path, method));
    if (auto routesAtPath = _routes.get(path, null)) {
      return routesAtPath.get(method, null);
    } 
    return null;
  }

  O addRoute(this O)(DRoute newRoute) {
    debug writeln("Adding route at '%s'".format(newRoute.path));
    if (newRoute) {
      DRoute[HTTPMethod] routesAtPath = _routes.get(newRoute.path, null);
      routesAtPath[newRoute.method] = newRoute;

      if (auto myController = cast(DAPPPageController)newRoute.controller) {
        myController.app(this);
      }

      _routes[newRoute.path] = routesAtPath;
    }
    return cast(O)this; }
    
  // #region Request Handling
    void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
      request(newRequest, newResponse, null); 
    }

    void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options) {
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
    }
  // #endregion 
}
auto App() { return new DApp; }
