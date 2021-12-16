module uim.apps.controllers.creators.login;

@safe:
import uim.apps;

class DAPPCreatorLogin : DAPPCreator {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override DOOPEntity create(STRINGAA parameters) {
    auto entity = createEntities["login"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("login", "login"~to!string(now)));
    entity["accountName"] = parameters.getValue(["entity_accountName", "accountName"], "");
    if (database) database["central", "logins"].insertOne(entity);        

    return entity;
  }

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    result["results"]["login"] = create(parameters).toJson;
    return result;
  }
}
auto APPCreatorLogin() { return new DAPPCreatorLogin; }
auto APPCreatorLogin(DAPPUIM myApp) { return new DAPPCreatorLogin(myApp); }
auto APPCreatorLogin(DAPPUIM myApp, string myName) { return new DAPPCreatorLogin(myApp, myName); }
auto APPCreatorLogin(DAPPUIM myApp, DETBBase myDatabase) { return new DAPPCreatorLogin(myApp, myDatabase); }
auto APPCreatorLogin(DAPPUIM myApp, string myName, DETBBase myDatabase) { return new DAPPCreatorLogin(myApp, myName, myDatabase); }
