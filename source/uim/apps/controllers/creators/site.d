module uim.apps.controllers.creators.site;

@safe:
import uim.apps;

class DAPPCreatorSite : DAPPCreator {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override DOOPEntity create(STRINGAA parameters) {
    auto col = database["central", "sites"];
    if (col.notNull) {
      auto entity = col.create
      .name(parameters.get("site", "site"~to!string(now)));
      entity.save; }       

    return entity;
  }

  override Json message(STRINGAA parameters) {
    auto result = Json.emptyObject;
    return super.message(result, parameters);
  }

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    result["results"]["site"] = create(parameters).toJson;
    return result;
  }
}
auto APPCreatorSite() { return new DAPPCreatorSite; }
auto APPCreatorSite(DAPPUIM myApp) { return new DAPPCreatorSite(myApp); }
auto APPCreatorSite(DAPPUIM myApp, string myName) { return new DAPPCreatorSite(myApp, myName); }
auto APPCreatorSite(DAPPUIM myApp, DETBBase myDatabase) { return new DAPPCreatorSite(myApp, myDatabase); }
auto APPCreatorSite(DAPPUIM myApp, string myName, DETBBase myDatabase) { return new DAPPCreatorSite(myApp, myName, myDatabase); }
