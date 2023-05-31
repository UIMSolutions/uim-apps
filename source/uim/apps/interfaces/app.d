module uim.apps.interfaces.app;

import uim.apps;
@safe:

interface IApp {
  ILayout layout();

  DView[string] views;
  DController[string] controllers;
}
