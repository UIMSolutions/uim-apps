module uim.apps.controllers.pages.controller;
/**************************************************/
/* This package contains general page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPPageController : DController {
  mixin(APPPageControllerThis!("APPPageController"));

  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DETBTenant", "tenant"));

  // Initialization (= hook method)
  override void initialize() {
    debugMethodCall(moduleName!DAPPPageController~"::DAPPPageController("~this.name~"):initialize");   
    super.initialize;

    this
      .language("en") 
      .mimetype("text/html");
    
    requestReader = APPRequestReader(this);
    sessionReader = APPSessionReader(this);  

    this
      .links(MVCLinkContainer)
      .metas(MVCMetaContainer) 
      .scripts(MVCScriptContainer) 
      .styles(MVCStyleContainer); 
  }

  mixin(OProperty!("Session", "globalSession"));
  mixin(OProperty!("string[]", "pageActions"));
  mixin(OProperty!("bool", "hasGlobalSession"));

  mixin(OProperty!("DAPPView", "view"));
  mixin(OProperty!("DAPPView", "errorView"));

  // Required checks for the page flow
  mixin(OProperty!("string[]", "sessionData"));

  mixin(APPParameter!("canonical")); 
  mixin(APPParameter!("jsPath")); 
  mixin(APPParameter!("pageTitle"));
  mixin(APPParameter!("pageBreadcrumbs"));
  mixin(APPParameter!("pgPath")); 
  mixin(APPParameter!("title")); 

  DAPPRequestReader requestReader;
  DAPPSessionReader sessionReader;

  mixin(OProperty!("DForm", "form"));

	/// layout for page
	DAPPLayout _layout;
	O layout(this O)(DAPPLayout newlayout) { 
    _layout = newlayout; 
    return cast(O)this; }
	auto layout() { 
    if (_layout) return _layout; 
    if (auto c = cast(DAPPPageController)this.controller) { return c.layout; } 
    if (this.app) return this.app.layout; 
    return null; 
  }

  O pageActions(this O)(string[] actions...) { this.pageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions...) { this.addPageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions) { this.pageActions(this.pageActions~actions); return cast(O)this; }

  mixin(OProperty!("ViewModes", "viewMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA
  mixin(OProperty!("DataModes", "dataMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA

/*   mixin(OProperty!("DController", "securityController")); 
  mixin(OProperty!("DAPPSecurityOptions", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(APPSecurityOptions(newOptions)); return cast(O)this; }  
 */  

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DMVCScriptContainer", "scripts"));
  mixin(OProperty!("DMVCStyleContainer", "styles"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPPageController~":DAPPPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
        
    this.appSession = getAppSession(options);
    if (appSession) { this.site(appSession.site); }
  }

  override string stringResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPPageController~":DAPPPageController("~this.name~")::stringResponse");
    this.links.add(["rel":"canonical", "href": this.canonical]);
    super.stringResponse(options);
    if (hasError) { return null; }
    
    if (view) {
      return view.render(options);
    }
    return "";															
  }

  DH5Obj[] pageContent(STRINGAA reqParameters) { 
    debugMethodCall(moduleName!DAPPPageController~":DAPPPageController("~this.name~")::pageContent");
    auto result = form ? form.toH5(reqParameters) : null;

    // debug writeln("return result pageContent(STRINGAA reqParameters)");
    return result; 
  }

  void jsCode(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPPageController~":DAPPPageController::jsCode");
    string appSessionId = _request && _request.session ? _request.session.id : options.get("appSessionId", "");
    auto appSession = getAppSession(options);

    if (appSession && viewMode == ViewModes.JS) 
      addToPageScript(options, 
        setSessionStorage(["sessionId": (appSession.session ? appSession.session.id.toString : ""), "siteId": (appSession.site ? appSession.site.id.toString : "")]));
  }


/*   override DH5Obj[] toH5(STRINGAA reqParameters) { 
    auto loginId = reqParameters.get("loginId", "");
    // debug writeln("...in login2:loginid = ", loginId);
    auto body_ = H5Div(["page-wrapper"], 
      (showAppTitle ? "appTitle" : "")~
      pageBody.toString
    ).toString;
  } */

  /* Json toJson(STRINGAA reqParameters) {
    Json result = Json.emptyObject; // super.toJson(reqParameters);

    result["login"] = this.login; 
    if (this.loginRequired) {
      auto loginId = reqParameters.get("loginId", "");
      requestHTTP(reqParameters.get("httpMode", "")~"://"~reqParameters.get("Host", "")~"/api/v1/logins?id="~loginId,
        (scope req) {
          req.method = HTTPMethod.POST;
          req.writeJsonBody(["id": loginId]);
        },
        (scope res) {
          this.login(parseJsonString(res.bodyReader.readAllUTF8()));
          logInfo("login: %s", this.login);
        }
      );

      if (this.login == Json(null)) {
        // debug writeln("login not found");
        _response.redirect("/login");
        return result;
      }
    }
    result["login"] = this.login; 

    string sessionId;
    result["session"] = this.session; 
    if (this.sessionRequired) {
      if (!_request.session) { 
        // debug writeln("No session available");
        _response.redirect("/login");  
        return result; } 
      
      sessionId = readSessionId(_request, reqParameters);
      
      if (sessionId.empty) {
        _response.redirect("/login");
        return result;
      }

      requestHTTP(reqParameters.get("httpMode", "")~"://"~reqParameters.get("Host", "")~"/api/v1/sessions?id="~reqParameters.get("sessionId", ""),
        (scope req) {
          req.method = HTTPMethod.POST;
          req.writeJsonBody(["name": "My Name"]);
        },
        (scope res) {
          this.session(parseJsonString(res.bodyReader.readAllUTF8()));
          logInfo("session: %s", this.session);
        }
      );

      if (this.session == Json(null)) {
        // debug writeln("session not found");
        _response.redirect("/login");
        return result;
      }
      _session.remove("_id");
      _session["lastAccess"] = toTimestamp(now());
      this.app.database.update("central", "sessions", ["id":sessionId], session); 
    }
    result["session"] = this.session; 
/*     reqParameters.addScript(
      setSessionStorage(
        ["sessionId":reqParameters.get("sessionId", "")]
      )
    );
 * /
    string siteId;
    result["site"] = this.site; 
    if (this.siteRequired) {
      siteId = reqParameters.get("siteId", "");
      
      if (siteId.empty) {
        _response.redirect("/sites");
        return result;
      }

      requestHTTP(reqParameters.get("httpMode", "")~"://"~reqParameters.get("Host", "")~"/api/v1/sites?id="~reqParameters.get("siteId", ""),
        (scope req) {
          req.method = HTTPMethod.POST;
          req.writeJsonBody(["siteId": siteId]);
        },
        (scope res) {
          this.site(parseJsonString(res.bodyReader.readAllUTF8()));
          logInfo("site: %s", this.site);
        }
      );

      if (this.site == Json(null)) {
        // debug writeln("site not found");
        _response.redirect("/login");
        return result;
      }
      _site.remove("_id");
      _site["lastAccess"] = toTimestamp(now());
      this.app.database.update("central", "sites", ["id":siteId], site); 
    }
    result["site"] = this.site; 
/*     reqParameters.addScript(
      setSessionStorage(["siteId":reqParameters.get("siteId", "")])); 
 * /
    return result;
  } */
}
mixin(APPPageControllerCalls!("APPPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPPageController); 
}}