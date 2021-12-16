module uim.apps.controllers.actions.interface_;

@safe:
import uim.apps;

interface IAPPAction  {
  string nextUrl();
  string redirectUrl();

  void beforeResponse(STRINGAA reqParameters);
  void request(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters);
}