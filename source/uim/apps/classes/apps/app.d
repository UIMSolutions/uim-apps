/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.apps.classes.apps.app;

import uim.apps;
@safe:

class DApp : DApplication, IRouteManager, IRequestHandler, IApp, IControllerManager, IViewManager, ILayoutManager { 
  this() { super(); }
  this(string appName) { this().name(appName); }
  this(string appName, string appRootPath) { this(appName).rootPath(appRootPath); }

/*   this(IRoute[] routes...) { this().addRoutesappRootPath); }
  this(string appName, IRoute[] routes...) { this(appName).rootPath(appRootPath); }
  this(string appName, string appRootPath, IRoute[] routes...) { this(appName).rootPath(appRootPath); }
 */
  mixin EntityBaseTemplate;

  mixin ControllerContainerTemplate;
  mixin ControllerManagerTemplate;

  mixin SessionContainerTemplate;
  mixin SessionManagerTemplate; 

  mixin ViewContainerTemplate;
  mixin ViewManagerTemplate;

  mixin LayoutContainerTemplate;
  mixin LayoutManagerTemplate;

  mixin RouteManagerTemplate;

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .className("App")
      .actions(ControllerContainer)
      .registerPath(className.toLower); 

    controllerContainer(ControllerContainer);
    viewContainer(ViewContainer);
  }

  // #region Managers 
    mixin(OProperty!("IAppManager", "manager"));

  // #region parameters
    mixin(MVCParameter!("rootPath"));
	
	  // Background color of the App. If set, this color willmixin(MVCParameter!("backgroundImage")) override the default background defined by the theme.*/
		mixin(MVCParameter!("backgroundColor"));
		
		// Background image of the App. If set, this image will override the default background defined by the theme.
		mixin(MVCParameter!("backgroundImage"));
			
		// Opacity of the background image. The opacity can be set between 0 (fully transparent) and 1 fully opaque).
		mixin(OProperty!("double", "backgroundImageOpacity"));
					 
		// Whether the background image (if configured) should be proportionally stretched to cover the whole App (false) or whether it should be tiled (true).
		mixin(OProperty!("bool", "backgroundImageRepeat"));
  // #endregion parameters

  // Application data 
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("size_t", "versionNumber"));

  O importTranslations(this O)() {
    return cast(O)this;
  } // TODO

  // Interfaces
  mixin(OProperty!("DRoute[HTTPMethod][string]", "routes"));

  // Main Containers - Allways first
  mixin(OProperty!("DMVCLinkContainer",   "links"));
  mixin(OProperty!("DMVCMetaContainer",   "metas"));
  mixin(OProperty!("DScriptContainer", "scripts"));
  mixin(OProperty!("DStyleContainer",  "styles"));

  // View and Controllers
  // #region Managing controllers    
    mixin(OProperty!("DPageController",  "indexController"));
    mixin(OProperty!("DPageController",  "errorController"));

  // #endregion

  // #region Managing actions
    mixin(OProperty!("DControllerContainer",  "actions"));
  // #endregion
    
  // #region Request Handling
    void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
      request(newRequest, newResponse, null); 
    }

    void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options) {
      debugMethodCall(moduleName!DApp~":DApp("~this.name~")::request(req, res, requestParameters)");

      writeln("rootPath = \t'%s'".format(this.rootPath));
      writeln("newRequest.fullURL = \t'%s'".format(newRequest.fullURL));
      writeln("newRequest.rootDir = \t'%s'".format(newRequest.rootDir));
      writeln("newRequest.path    = \t'%s'".format(newRequest.path));
      writeln("newRequest.path.length = \t'%s'".format(newRequest.path.length));

      auto myPath = options.get("path", newRequest.path);
      writeln("myPath = \t'%s'".format(myPath));

      auto myRoutePath = myPath;
      if (myPath.indexOf(rootPath) == 0) {
        myRoutePath = myPath[rootPath.length..$];
        foreach(myRoute; this.routesWithMethod(newRequest.method)) {
          if (myRoute.path == myRoutePath) {
            debug writeln("Found app route");

            myRoute.controller.request(newRequest, newResponse, options);
            return;
          }
        }
      }
    }
  // #endregion 
}
auto App() { return new DApp; }
auto App(string appName) { return new DApp(appName); }
auto App(string appName, string appRootPath) { return new DApp(appName, appRootPath); }
