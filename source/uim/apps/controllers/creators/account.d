module uim.apps.controllers.creators.account;

@safe:
import uim.apps;

/* static this() {
  appErrorCodes[appErrorPrefix+201] = "Could not create account";
}
 */
class DAPPCreatorAccount : DAPPCreator {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override DOOPEntity create(STRINGAA parameters) {
    auto entity = createEntities["account"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("account", "account"~to!string(now)));
    entity["peer"] = parameters.get("peer", "");
    if (database) database["central", "accounts"].insertOne(entity);        

    return entity;
  }

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    result["results"]["account"] = create(parameters).toJson;
    return result;
  }
}
auto APPCreatorAccount() { return new DAPPCreatorAccount; }
auto APPCreatorAccount(DAPPUIM myApp) { return new DAPPCreatorAccount(myApp); }
auto APPCreatorAccount(DAPPUIM myApp, string myName) { return new DAPPCreatorAccount(myApp, myName); }
auto APPCreatorAccount(DAPPUIM myApp, DETBBase myDatabase) { return new DAPPCreatorAccount(myApp, myDatabase); }
auto APPCreatorAccount(DAPPUIM myApp, string myName, DETBBase myDatabase) { return new DAPPCreatorAccount(myApp, myName, myDatabase); }

unittest {
  version(uim_apps) {
    /// TODO 
  }}

