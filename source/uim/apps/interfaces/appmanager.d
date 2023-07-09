module uim.apps.interfaces.appmanager;

import uim.apps;
@safe:

interface IAppManager : IControllerManager, IViewManager {
  ILayout layout();
  IEntityBase entityBase(); 

  DAppContainer appContainer();

  void apps(IApp[string] someApps);
  void apps(IApp[] someApps...);
  void apps(IApp[] someApps);
  IApp[] apps();
  string[] appNames();

  IApp app(string aName);
  void app(string aName, IApp aApp);

  void defaultApp(IApp aApp);
  IApp defaultApp();

  void errorApp(IApp aApp);
  IApp errorApp();

  bool hasApp(IApp aApp);
  bool hasApp(string aName);

  // Add app if not exitst
  void addApp(IApp aApp);
  void addApp(string aName, IApp aApp);

  // Update existing app
  void updateApp(IApp aApp);
  void updateApp(string aName, IApp aApp);

  // Remove existing app
  void removeApp(IApp aApp);
  void removeApp(string aName);
}