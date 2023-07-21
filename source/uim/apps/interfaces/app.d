module uim.apps.interfaces.app;

import uim.apps;
@safe:

interface IApp : IApplication, IRouteManager, IControllerManager, IMVCObject, IRequestHandler {
  ILayout layout();
  IEntityBase entityBase();
}
