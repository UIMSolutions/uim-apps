module uim.apps.interfaces.appmanager;

import uim.apps;
@safe:

interface IAppManager : IControllerManager {
  ILayout layout();
  IEntityBase entityBase(); 

  DControllerContainer controllerContainer();
}