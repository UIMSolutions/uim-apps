module uim.apps.interfaces.app;

import uim.apps;
@safe:

interface IApp {
  ILayout layout();

  DViewContainer views();
  DControllerContainer controllers();
}
