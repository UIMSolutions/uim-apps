module uim.apps.controllers.controller;

@safe:
import uim.apps;

class DAPPController {
  this() { initialize; }
  this(DAPPApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
  void initialize() {
    this.id = randomUUID;
    this.name = "APPController"; 
  }
  
  /// Owning controller
  mixin(OProperty!("DAPPApplication", "app"));
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "mimetype"));
  mixin(OProperty!("DAPPController", "controller"));
  mixin(OProperty!("DAPPController[]", "controllers")); // Cascading controllers
  mixin(OProperty!("DAPPControllerComponent[]", "components")); // Cascading controllers components

  HTTPServerRequest _request;
  HTTPServerRequest request() { return _request; }
  void request(HTTPServerRequest newRequest) { _request = newRequest; }

  HTTPServerResponse _response;
  HTTPServerResponse response() { return _response; }
  void response(HTTPServerResponse newResponse) { _response = newResponse; }

  mixin(OProperty!("DOOPEntity", "session"));
  mixin(OProperty!("string", "responseResult"));

  mixin(OProperty!("bool", "loginRequired"));
  mixin(OProperty!("bool", "sessionRequired"));
  mixin(OProperty!("bool", "siteRequired"));

  /// Additional parameters
  mixin(OProperty!("STRINGAA", "parameters"));

  /// Configuration of controller
  mixin(OProperty!("Json", "config"));

  // #region error handling
    mixin(OProperty!("string", "error"));

    bool hasError() { return (this.error.length > 0); } 
  // #endregion error
  
  // #region database
    DETBBase _database; 
    O database(this O)(DETBBase aDatabase) { 
      _database = aDatabase; 
      return cast(O)this; }

    DETBBase database() {
      if (_database) { return _database; } // has his own database
      if (this.controller && this.controller.database) { return this.controller.database; } // owner has database
      if (auto myApp = cast(DAPPApplication)app) { return myApp.database; } // Leading app has database
      return null; // no database found
    }
  // #endregion database

  DAPPController create() {
    return APPController;
  }
  unittest {
    version(test_uim_apps) {
      /// TODO 
    }}

    DAPPController copy() {
    auto result = create;
    result.app = this.app;
    result.name = this.name;
    result.controller = this.controller;
    return result;
  }
  unittest {
    version(test_uim_apps) {
      /// TODO 
    }}

  Json message(STRINGAA options) {
    auto json = message(Json.emptyObject, options);
    return json;
  }
  unittest {
    version(test_uim_apps) {
      /// TODO 
    }}

  Json message(Json json, STRINGAA options) {    
    if ("errors" !in json) json["errors"] = Json.emptyArray;
    if ("warnings" !in json) json["warnings"] = Json.emptyArray;
    if ("infos" !in json) json["infos"] = Json.emptyArray;
    if ("results" !in json) json["results"] = Json.emptyObject;

    return json;
  }
  unittest {
  version(test_uim_apps) {
    /// TODO 
  }}


  auto requestParameters(STRINGAA defaultValues = null) {
    STRINGAA result = defaultValues.dup; 
    result["httpMode"] = (this.request.fullURL.toString.indexOf("https") == 0 ? "https" : "http");
    result["request"] = this.request.toString;
    result["method"] = to!string(this.request.method);
    result["form"] = this.request.form.toString;
    result["peer"] = this.request.peer;
    result["host"] = this.request.host;
    result["path"] = this.request.path;
    result["rootDir"] = this.request.rootDir;
    result["queryString"] = this.request.queryString;
    result["fullURL"] = this.request.fullURL.toString;
    result["json"] = this.request.json.toString;
    result["username"] = this.request.username;
    result["password"] = this.request.password;
    result["contentType"] = this.request.contentType;
    result["contentTypeParameters"] = this.request.contentTypeParameters;
    result["timeCreated"] = to!string(toTimestamp(this.request.timeCreated));
    result["persistent"] = to!string(this.request.persistent);
    
    foreach(key; this.request.params.byKey) result[key] = this.request.params[key];
    foreach(key; this.request.headers.byKey) result[key] = this.request.headers[key];
    foreach(key; this.request.query.byKey) result[key] = this.request.query[key];
    foreach(key; this.request.form.byKey) result[key] = this.request.form[key];

    readSessionId(this.request, result);
    return result;
  }

  void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPController~":DAPPController::beforeResponse");
    this.error(""); // delete old error
    if ("appSessionId" !in options) {      
      options["appSessionId"] = this.request && this.request.session  ? this.request.session.id : null;
    }
    debug writeln(moduleName!DAPPController~":DAPPController::appSessionId -> ", options["appSessionId"]);

    auto appSession = getAppSession(options);
    if (!appSession) {
      debug writeln("[INFO] No AppSession with Id '%s'".format(options.get("appSessionId", null)));

      if (loginRequired) {
        debug writeln("No appSession for Login");        
        this.error("Login required");
        options["redirect"] = "/login";
        return; 
      }
      if (sessionRequired) {
        debug writeln("No appSession for Session");        
        this.error("Session required - Please login");
        options["redirect"] = "/login";
        return; 
      }
      if (siteRequired) {
        debug writeln("No appSession for Site");        
        this.error("Site required - Please select");
        options["redirect"] = "/sites";
        return; 
      }
    }

    if (loginRequired) {
      debug writeln("Has login?");
      if (appSession && !appSession.login) {
        debug writeln("No Login");

        this.error("Login required");
        options["redirect"] = "/login";
        return; 
      }
      else {
        debug writeln("login found");
      }
    }

    if (sessionRequired) {
      debug writeln("Has session?");
      if (appSession && !appSession.session) {
        debug writeln("No Session");

        this.error("Session required - Please login");
        options["redirect"] = "/login";
        return; 
      }
      else {
        debug writeln("session found");
      }
    }

    if (siteRequired) {
      debug writeln("Has site?");
      if(appSession && !appSession.site) {
        debug writeln("No Site");

        this.error("Site required - Please select");
        options["redirect"] = "/sites";
        return; 
      }
      else {
        debug writeln("site found");
      }
    }
  }    

  void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPController~":DAPPController::afterResponse");

    if (auto appSession = getAppSession(options)) {
      if (appSession.session) { 
        appSession.session.save;
      }
    }
  }  

  string stringResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPController~":DAPPController::stringResponse");
    return "";
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options = null) {
		debugMethodCall(moduleName!DAPPController~":DAPPController::request(req, res, reqParameters)");

		this.request = newRequest; this.response = newResponse;
    options = requestParameters(options);
		beforeResponse(options);

    if (hasError) {
      debug writeln("Found error -> ", this.error);
      if ("redirect" in options) {
        auto redirect = options["redirect"]; 
        options.remove("redirect");
        newResponse.redirect(redirect);
      } 
    }

		if ("redirect" in options) {
      debug writeln("Found redirect to ", options["redirect"]);
      auto redirect = options["redirect"]; 
      options.remove("redirect");
      newResponse.redirect(redirect);
    } 

		debug writeln("_mimetype = '"~_mimetype~"'");
    auto result = stringResponse(options);

    afterResponse(options);
    
		this.response.writeBody(result, _mimetype); }
	unittest {
		version(uim_html) {
			/// TODO
	}}
}
auto APPController() { return new DAPPController; }
auto APPController(DAPPApplication myApp) { return new DAPPController(myApp); }


unittest {
	version(test_uim_apps) {
/* 		assert(APPController.view.name == "H5NullView"); // Controller has default view
		assert(APPController.view(APPView).view.name == "APPView"); // Controller has new view */
}}