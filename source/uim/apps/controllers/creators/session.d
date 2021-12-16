module uim.apps.controllers.creators.session;

@safe:
import uim.apps;

class DAPPCreatorSession : DAPPCreator {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override DOOPEntity create(STRINGAA parameters) {
    auto entity = createEntities["session"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("session", "session"~to!string(now)));
    if (database) database["central", "sessions"].insertOne(entity);        

    return entity;
  }

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    if (auto session = create(parameters)) {
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Could not create session";
      result["errors"] ~= error;
    }
    return result; }
  unittest {
    version(uim_apps) {
      /// TODO 
    }}
  }
auto APPCreatorSession() { return new DAPPCreatorSession; }
auto APPCreatorSession(DAPPUIM myApp) { return new DAPPCreatorSession(myApp); }
auto APPCreatorSessionAPPCreatorLogin(DAPPUIM myApp, string myName) { return new DAPPCreatorSession(myApp, myName); }
auto APPCreatorSession(DAPPUIM myApp, DETBBase myDatabase) { return new DAPPCreatorSession(myApp, myDatabase); }
auto APPCreatorSession(DAPPUIM myApp, string myName, DETBBase myDatabase) { return new DAPPCreatorSession(myApp, myName, myDatabase); }

unittest {
  version(uim_apps) {
    /// TODO 
  }}

