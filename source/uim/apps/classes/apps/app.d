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
	
	Background color of the App. If set, this color willmixin(MVCParameter!("backgroundImage")) override the default background defined by the theme.*/
		mixin(MVCParameter!("backgroundColor"));
		
		Background image of the App. If set, this image will override the default background defined by the theme.
			mixin(MVCParameter!("backgroundImage"));
			
			Opacity of the background image. The opacity can be set between 0 (fully transparent) and 1 fully opaque).
			mixin(OProperty!("double", "
					backgroundImageOpacity"));
			
			
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
  mixin(OProperty!("DController[string]",  "controllers"));
  mixin(OProperty!("DView[string]",  "views"));
  
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
