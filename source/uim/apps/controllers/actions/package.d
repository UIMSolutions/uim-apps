module uim.apps.controllers.actions;

@safe:
import uim.apps;

public import uim.apps.controllers.actions.action;
public import uim.apps.controllers.actions.create;
public import uim.apps.controllers.actions.entity;
public import uim.apps.controllers.actions.entities;
public import uim.apps.controllers.actions.interface_;
public import uim.apps.controllers.actions.login;
public import uim.apps.controllers.actions.login2;
public import uim.apps.controllers.actions.setsite;
public import uim.apps.controllers.actions.system;


string entityCreateAction(string entityName, string rootPath, string collectionName, string classCategory) {
  return `class D`~entityName~`CreateAction : D`~classCategory~`CreateAction {
    `~appControllerThis(entityName~"CreateAction")~`

    override void initialize() {
      super.initialize;

      this
        .rootPath("`~rootPath~`") 
        .collectionName("`~collectionName~`");
    }
  }
  `~appControllerCalls(entityName~"CreateAction");
}

template EntityActions(string entityName, string rootPath, string collectionName, string classCategory) {
  const char[] EntityActions = entityCreateAction(entityName, rootPath, collectionName, classCategory)~
  `class D`~entityName~`UpdateAction : D`~classCategory~`UpdateAction {
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