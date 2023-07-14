module uim.apps.interfaces.app;

import uim.apps;
@safe:

interface IApp : IApplication, IRouteManager, IControllerManager, IMVCObject {
  ILayout layout();
  IEntityBase entityBase();
}
