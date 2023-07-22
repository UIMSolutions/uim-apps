module uim.apps.interfaces.appmanager;

import uim.apps;
@safe:

interface IAppManager : IViewManager, IControllerManager {
  IEntityBase entityBase(); 
  DAppContainer appContainer();
  DControllerContainer controllerContainer();
  DSessionContainer sessionContainer();
  DViewContainer viewContainer();

  void apps(IApp[string] someApps);
  void apps(IApp[] someApps...);
  void apps(IApp[] someApps);
  IApp[] apps();
  string[] appNames();

  IApp app(string aName);

  bool hasApp(IApp aApp);
  bool hasApp(string aName);

  // Add app if not exitst
  void addApp(IApp aApp);
  void addApp(string aName, IApp aApp);

  // Update existing app
  bool updateApp(IApp aApp);
  bool updateApp(string aName, IApp aApp);

  // Remove existing app
  bool removeApp(IApp aApp);
  bool removeApp(string aName);
}