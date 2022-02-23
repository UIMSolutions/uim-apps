module uim.apps.controllers.controller;

@safe:
import uim.apps;

class DAPPController : DAPPObject {
  mixin(APPControllerThis!("APPController"));

  // Initialization (= hook method)
  override void initialize() {
    debugMethodCall(moduleName!DAPPController~"::DAPPController("~this.name~"):initialize");   
    super.initialize;

    this
      .name("APPController"); 

    debug writeln("MimeType = ", this.mimetype);
  }
  
  mixin(APPParameter!("mimetype")); 

  /// Owning controller
  mixin(OProperty!("DAPPApplication", "app"));
  mixin(OProperty!("DAPPController", "controller"));
  mixin(OProperty!("DAPPControllerComponent[string]", "components")); // Cascading controllers components

  mixin(OProperty!("DAPPCheck[]", "checks"));
  O addChecks(this O)(DAPPCheck[] newChecks) {
    this.checks(this.checks~newChecks);
    return cast(O)this;
  }

  HTTPServerRequest _request;
  HTTPServerRequest request() { return _request; }
  void request(HTTPServerRequest newRequest) { _request = newRequest; }

  HTTPServerResponse _response;
  HTTPServerResponse response() { return _response; }
  void response(HTTPServerResponse newResponse) { _response = newResponse; }

  mixin(OProperty!("DOOPEntity", "session"));
  mixin(OProperty!("string", "responseResult"));

  /// Configuration of controller
  mixin(OProperty!("Json", "config"));

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

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}


version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}

  Json message(STRINGAA options) {
    auto json = message(Json.emptyObject, options);
    return json;
  }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}

  Json message(Json json, STRINGAA options) {    
    if ("errors" !in json) json["errors"] = Json.emptyArray;
    if ("warnings" !in json) json["warnings"] = Json.emptyArray;
    if ("infos" !in json) json["infos"] = Json.emptyArray;
    if ("results" !in json) json["results"] = Json.emptyObject;

    return json;
  }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);

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
    this.error(""); // delete existing error message
    debug writeln("MimeType = ", this.mimetype);

    if ("appSessionId" !in options) {      
      options["appSessionId"] = this.request && this.request.session  ? this.request.session.id : null;
    }
    debug writeln(moduleName!DAPPController~":DAPPController::appSessionId -> ", options["appSessionId"]);

    foreach(check; checks) {
      if (!check.controller(this).execute(options)) {
        this.error(check.error);
        options["redirect"] = check.redirectUrl;
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
		debugMethodCall(moduleName!DAPPController~":DAPPController("~this.name~")::request(req, res, reqParameters)");

    debug writeln("1 Mimetype = ", this.mimetype);

		this.request = newRequest; this.response = newResponse;
    options = requestParameters(options);
		beforeResponse(options);

    debug writeln("2 Mimetype = ", this.mimetype);
    
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

		debug writeln("_mimetype = '"~this.mimetype~"'");
    auto result = stringResponse(options);

    afterResponse(options);
    
		this.response.writeBody(result, this.mimetype); }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      
			/// TODO
	}}
}
mixin(APPControllerCalls!("APPController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPController);
}}