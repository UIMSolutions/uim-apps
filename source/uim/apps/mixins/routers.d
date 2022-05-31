module uim.apps.mixins.routers;

@safe:
import uim.apps;

template RouterFunction(string functionName, string controllerName, string appName, string content = "") {
  const char[] RouterFunction = `
void `~functionName~`(HTTPServerRequest req, HTTPServerResponse res) {
	debugMethodCall("`~functionName~`::request(req, res)");
  `~content~`
  `~controllerName~`(`~appName~`).request(req, res);
}
`;
}