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

  mixin(OProperty!("DAPPSession", "appSession"));
  mixin(OProperty!("DOOPEntity", "session"));
  mixin(OProperty!("string", "responseResult"));

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
    version(uim_apps) {
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
    version(uim_apps) {
      /// TODO 
    }}

  Json message(STRINGAA options) {
    auto json = message(Json.emptyObject, options);
    return json;
  }
  unittest {
    version(uim_apps) {
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
  version(uim_apps) {
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
    options["appSessionId"] = this.request && this.request.session  ? this.request.session.id 
                                                                    : "0"; 
  }    

  void afterResponse(STRINGAA options = null) {
  }  

  string stringResponse(STRINGAA options = null) {
    return "";
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options = null) {
		debugMethodCall(moduleName!DAPPController~":DAPPController::request(req, res, reqParameters)");
		this.request = newRequest; this.response = newResponse;
    auto reqParameters = requestParameters(options);
		beforeResponse(reqParameters);

		if ("redirect" in reqParameters) {
      debug writeln("Found redirect to ", reqParameters["redirect"]);
      auto redirect = reqParameters["redirect"]; 
      reqParameters.remove("redirect");
      this.response.redirect(redirect);
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
	version(uim_apps) {
/* 		assert(APPController.view.name == "H5NullView"); // Controller has default view
		assert(APPController.view(APPView).view.name == "APPView"); // Controller has new view */
}}