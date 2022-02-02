module uim.apps.controllers.creators.site;

@safe:
import uim.apps;

class DAPPCreatorSite : DAPPCreator {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }

  override DOOPEntity create(STRINGAA parameters) {
    auto col = database["systems", "system_sites"];

    return  col.notNull ? col
      .createFromTemplate
      .name(parameters.get("site", "site"~to!string(now)))  
      .save : null;
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
auto APPCreatorSite(DAPPApplication myApp) { return new DAPPCreatorSite(myApp); }
