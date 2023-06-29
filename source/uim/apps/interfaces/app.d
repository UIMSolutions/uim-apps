module uim.apps.interfaces.app;

import uim.apps;
@safe:

interface IApp : IControllerManager {
  ILayout layout();
  IEntityBase entityBase();
}
