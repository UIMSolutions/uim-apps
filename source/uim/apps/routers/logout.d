module uim.apps.routers.logout;

@safe:
import uim.apps;

void uimLogout(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLogout~":uimLogout");

  APPLogoutPageController(thisServer).request(req, res);
}