module uim.apps.routers.logout;

@safe:
import uim.apps;

void uimLogout(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLogout~":uimLogout");

  APPLogoutPageController(server).request(req, res);
}