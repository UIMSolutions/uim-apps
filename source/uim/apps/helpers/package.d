module uim.apps.helpers;

@safe:
import uim.apps;

public import uim.apps.helpers.inputinterface;
public import uim.apps.helpers.outputinterface;
public import uim.apps.helpers.router;

template AddRoutes(string router, string rootPath, string rootName) {
  const char[] AddRoutes = `
`~router~`
  .get("`~rootPath~`", &`~rootName~`Index)
  .get("`~rootPath~`/", &`~rootName~`Index)
  .get("`~rootPath~`/view", &`~rootName~`View)
  .get("`~rootPath~`/create", &`~rootName~`Create)
  .get("`~rootPath~`/edit", &`~rootName~`Edit)
  .get("`~rootPath~`/delete", &`~rootName~`Delete)
  .get("`~rootPath~`/:entityName", &`~rootName~`Index);

`~router~`
  .post("`~rootPath~`/actions/create", &`~rootName~`CreateAction)
  .post("`~rootPath~`/actions/update", &`~rootName~`UpdateAction)
  .post("`~rootPath~`/actions/delete", &`~rootName~`DeleteAction);
`;
}

template PageControllerCalls(string rootName, string controllerGroupName, string appName) {
  const char[] PageControllerCalls = `
void `~rootName~`Index(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Index~":`~rootName~`Index");

  `~controllerGroupName~`IndexPageController(`~appName~`).request(req, res);
}

void `~rootName~`Create(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Create~":`~rootName~`Create");

  `~controllerGroupName~`CreatePageController(`~appName~`).request(req, res);
}

void `~rootName~`View(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`View~":`~rootName~`View");

  `~controllerGroupName~`ReadPageController(`~appName~`).request(req, res);
}

void `~rootName~`Edit(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Edit~":`~rootName~`Edit");

  `~controllerGroupName~`UpdatePageController(`~appName~`).request(req, res);
}
void `~rootName~`Delete(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Delete~":`~rootName~`Delete");

  `~controllerGroupName~`DeletePageController(`~appName~`).request(req, res);
}`;
}

template ActionCalls(string rootName, string className, string appName) {
  const char[] ActionCalls = `
void `~rootName~`CreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`CreateAction~":`~rootName~`CreateAction");

  `~className~`CreateAction(`~appName~`).request(req, res);
}

void `~rootName~`UpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`UpdateAction~":`~rootName~`UpdateAction");

  `~className~`UpdateAction(`~appName~`).request(req, res);
}

void `~rootName~`DeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`DeleteAction~":`~rootName~`DeleteAction");

 `~className~`DeleteAction(`~appName~`).request(req, res);
}
`;
}