module uim.apps.controllers.pages.page;
/**************************************************/
/* This package contains general page definitions */
/**************************************************/

@safe:
import uim.apps;

enum ViewModes { HTML, JS, XML }
enum DataModes { Local, REST }

class DAPPPage : DH5AppPage {
  this() { 
    super(); 

    this.entities(null);

    requestReader = APPRequestReader(this);
    sessionReader = APPSessionReader(this); } 
  
  this(DAPPView myView) {
    this().view(myView);
  }

  mixin(SProperty!("Session", "globalSession"));
  mixin(SProperty!("bool", "hasGlobalSession"));

  mixin(SProperty!("string", "pageTitle"));
  mixin(SProperty!("string", "pageBreadcrumbs"));
  mixin(SProperty!("string[]", "pageActions"));

  protected DAPPCheck[] _checks;
  DAPPCheck[] checks() { return _checks; }
/*   O checks(this O)(DAPPCheck[] someChecks...) {
    checks(someChecks);
    return cast(O)this;
  }
 */  O checks(this O)(DAPPCheck[] someChecks) {
    foreach (check; someChecks) {
      _checks ~= check.page(this);
    }
    return cast(O)this;
  }
  O clearChecks(this O)() { 
    _checks = null; 
    return cast(O)this; }

  DAPPRequestReader requestReader;
  DAPPSessionReader sessionReader;

  DETBBase _database; 
  auto database(DETBBase aDatabase) { _database = aDatabase; }
  auto database() {
    if (_database) return _database;
    if (auto myApp = cast(DAPPUIM)app)
       return myApp.database;
    return null;
  }

  DAPPPageHeader _pageHeader;
  O pageHeader(this O)(DAPPPageHeader newPageHeader) { 
    _pageHeader = newPageHeader; 
    // _pageHeader.page(this);
    return cast(O)this; }
  auto pageHeader() { return _pageHeader; }
  
  mixin(SProperty!("DAPPForm", "form"));

  mixin(SProperty!("string", "collectionName"));
  mixin(SProperty!("string", "jsPath"));
  mixin(SProperty!("string", "pgPath"));
  mixin(SProperty!("string", "entitiesName"));
  mixin(SProperty!("string", "entityName"));

  protected DOOPEntity[] _entities;
  protected void _setEntities(DOOPEntity[] newEntities) { 
    // debug writeln("_setEntities(DOOPEntity[] newEntities)");
    _entities = newEntities; }
  @property DOOPEntity[] entities() { return _entities; }
  @property O entities(this O)(DOOPEntity[] newEntities) { 
    // debug writeln("O entities(this O)(DOOPEntity[] newEntities)");
    // _setEntities(newEntities); 
    _entities = newEntities;
    // debug writeln("return");
    return cast(O)this; }

  O pageActions(this O)(string[] actions...) { this.pageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions...) { this.addPageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions) { this.pageActions(this.pageActions~actions); return cast(O)this; }

  mixin(SProperty!("ViewModes", "viewMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA
  mixin(SProperty!("DataModes", "dataMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA

/*   mixin(SProperty!("DAPPController", "securityController")); 
  mixin(SProperty!("DAPPSecurityOptions", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(APPSecurityOptions(newOptions)); return cast(O)this; }  
 */  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPPage~":DAPPPage::beforeResponse");
    if ("redirect" in options) { return; }

		debug writeln("DAPPPage is rendering view (", view.name, ")");

    debug writeln(moduleName!DAPPPage~":DAPPPage::beforeResponse - Read http session");
    if (_request.session) options["appSessionId"] = _request.session.id;

    foreach (check; checks) {
      debug writeln(moduleName!DAPPAction~":DAPPAction::beforeResponse - check -> "~check.name);
      if (auto redirectUrl = APPCheckLogin.check(_request, _response, options)) {
        options["redirect"] = redirectUrl;
        break; }} 

    if (checks) {
      if ("redirect" in options) {
        debug writeln(moduleName!DAPPAction~":DAPPAction::beforeResponse - check -> Redirect to ", options["redirect"]); }
      else {
        debug writeln(moduleName!DAPPAction~":DAPPAction::check -> All checks successful, no redirect"); }
    }
    else {
      debug writeln(moduleName!DAPPAction~":DAPPAction::beforeResponse - check -> No checks, no worry ;-)");
    }}
  unittest {
    version(uim_apps) {
      /// TODO 
    }}

  DH5Obj[] pageContent(STRINGAA reqParameters) { 
    // debug writeln("DAPPPage:pageContent(STRINGAA reqParameters)");
    auto result = form ? form.toH5(reqParameters) : null;

    // debug writeln("return result pageContent(STRINGAA reqParameters)");
    return result; 
  }

  void jsCode(STRINGAA options = null) {
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
auto APPPage() { return new DAPPPage; }
auto APPPage(DAPPView myView) { return new DAPPPage(myView); }

unittest {
	version(uim_apps) {
		assert(APPPage.view.name == "H5NullView"); // Controller has default view
		assert(APPPage.view(APPView).view.name == "APPView"); // Controller has new view
}}