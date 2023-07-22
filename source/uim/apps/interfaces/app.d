module uim.apps.interfaces.app;

import uim.apps;
@safe:

interface IApp : IApplication, IRouteManager, IControllerManager, IMVCObject, IRequestHandler {
  IEntityBase entityBase();
}
