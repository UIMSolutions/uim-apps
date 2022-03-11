module uim.apps.controllers.actions;

@safe:
import uim.apps;

public import uim.apps.controllers.actions.action;
public import uim.apps.controllers.actions.create;
public import uim.apps.controllers.actions.interface_;
public import uim.apps.controllers.actions.login;
public import uim.apps.controllers.actions.login2;
public import uim.apps.controllers.actions.setsite;
public import uim.apps.controllers.actions.system;

template EnityActions(string entityName, string rootPath, string collectionName, string classCategory) {
  const char[] EnityActions = `
class D`~entityName~`CreateAction : D`~classCategory~`CreateAction {
  `~appControllerThis(entityName~"CreateAction")~`

  override void initialize() {
    super.initialize;

    this
      .rootPath("`~rootPath~`") 
      .collectionName("`~collectionName~`");
  }
}
`~appControllerCalls(entityName~"CreateAction")~`

class D`~entityName~`UpdateAction : D`~classCategory~`UpdateAction {
  `~appControllerThis(entityName~"UpdateAction")~`

  override void initialize() {
    super.initialize;

    this
      .rootPath("`~rootPath~`") 
      .collectionName("`~collectionName~`");
  }
}
`~appControllerCalls(entityName~"UpdateAction")~`

class D`~entityName~`DeleteAction : D`~classCategory~`DeleteAction {
  `~appControllerThis(entityName~"DeleteAction")~`

  override void initialize() {
    super.initialize;

    this
      .rootPath("`~rootPath~`") 
      .collectionName("`~collectionName~`");
  }
}
`~appControllerCalls(entityName~"DeleteAction")~`
`;
}