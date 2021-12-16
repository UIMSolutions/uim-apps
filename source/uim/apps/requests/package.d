module uim.apps.requests;

@safe:
import uim.apps;

class DAPPRequestReader {
  this(DAPPPage page) {
    _page = page;
  }

  mixin(OProperty!("DAPPPage", "page"));
  mixin(OProperty!("STRINGAA", "parameters"));

  STRINGAA read(HTTPServerRequest req, STRINGAA reqParameters) {
    if (page) foreach(k, v; page.parameters) if (k !in reqParameters) reqParameters[k] = v;
    reqParameters["htmlMode"] = to!string(req.method);
    return reqParameters;
  }
}
auto APPRequestReader(DAPPPage page) { return new DAPPRequestReader(page); }

unittest {
  version(uim_apps) {
    // TODO Add Tests
}}