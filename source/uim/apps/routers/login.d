module uim.apps.routers.login;

@safe:
import uim.apps;

void uimLoginPage(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLoginPage~":uimLoginPage");

  APPLoginPageController(thisServer).request(req, res);
}

void uimLoginAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLoginAction~":uimLoginAction");

  APPLoginActionController(thisServer).request(req, res);
}