module uim.apps.controllers.validators.site;

@safe:
import uim.apps;

class DAPPValidatorSite : DAPPValidator {
  mixin(ControllerThis!("APPValidatorSite"));
  
  bool siteIdValid(string siteId) { return siteId.isUUID && UUID(siteId) != UUID(); }

  override DEntity validate(STRINGAA reqParameters) {
    // Looking for a siteId
    string appSessionId = reqParameters.get("appSessionId", "");
    auto appSession = getAppSession(reqParameters);

    if (appSession) { // appSession exist
      auto site = appSession.site;
      if (!site) { // No site. Try to read from reqParameters
        auto siteIdParameter = "";
        siteIdParameter = reqParameters.get("siteId", "");
        
        if (!siteIdParameter.isUUID && appSession.session) { // not valid Id
          siteIdParameter = appSession.session["siteId"]; }

        if (!siteIdParameter.isUUID) // No site id found
          return null;
        
        if (database) { // Look into database, site exists?
          auto dbSite = database["systems", "system_sites"].findOne(UUID(siteIdParameter));
          if (dbSite) {
            // found site :-)
            dbSite.lastAccessedOn = toTimestamp(now);
            dbSite.save; // Update

            appSession.site = site;
            return site;
          }        
        }
      }
    }
    
    return null; // Not valid ;
  }

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    if(auto site = validate(parameters)) { // not validation error
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["site"] = site.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Site not found";
      result["errors"] ~= error;
    }
    return result;
  }
}
mixin(ControllerCalls!("APPValidatorSite"));

