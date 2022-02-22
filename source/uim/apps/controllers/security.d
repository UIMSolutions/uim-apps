module uim.apps.controllers.security;

@safe:
import uim.apps;

class DAPPSecurityController : DAPPController {
  mixin(APPControllerThis!("APPSecurityController"));

  override Json message(STRINGAA options) {
    // debug writeln("In DAPPSecurityController");
    auto json = super.message(options);
   
    string appSessionId = options.get("appSessionId", "");
    auto appSession = getAppSession(options);

    /* if (appSession) {
      /// login required ?
      auto jsonResults = json["results"];
      if (page.securityOptions.required("login")) {
        auto jsLogin = APPValidatorLogin(page, database).message(json, reqParameters);
        if (jsLogin != Json(null))
          appSession.login = createEntities["login"](jsLogin);
      }

      if (page.securityOptions.required("session")) {
        auto jsSession = APPValidatorSession(page, database).message(json, reqParameters);
        // debug writeln("-> with session: ", jsSession);
        if (jsSession != Json(null))
          appSession.session = createEntities["session"](jsSession);
      }

      if (page.securityOptions.required("site")) {        
        auto jsSite = APPValidatorSite(page, database).message(json, reqParameters);
        // debug writeln("-> with site: ", jsSite);
        if (jsSite != Json(null)) 
          appSession.site = createEntities["site"](jsSite);
      }
    }

    if (page && appSession) {
      /// Check if session valid (if required)
      if (page.securityOptions.required("session") && !appSession.session) page._response.redirect("/login"); 
      else // Check if site  valid (if required)
        if (page.securityOptions.required("site") && !appSession.site) page._response.redirect("/sites"); 
    } */

    return json;
  }
  unittest {
  version(test_uim_apps) {
    /// TODO 
  }}

  override Json message(Json json, STRINGAA options) {
    return super.message(json, options); }
} 
mixin(APPControllerCalls!("APPSecurityController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}