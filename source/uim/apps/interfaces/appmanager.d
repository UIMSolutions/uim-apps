module uim.apps.interfaces.appmanager;

import uim.apps;
@safe:

interface IAppManager : IViewManager, IControllerManager {
  IEntityBase entityBase();
   
  DAppContainer appContainer();
  DControllerContainer controllerContainer();
  DSessionContainer sessionContainer();
  DViewContainer viewContainer();

  IApp[] apps();
  string[] appNames();

  // get app
  IApp app(string aName);

  // check if app exists
  bool hasApp(IApp aApp);
  bool hasApp(string aName);

  // Add apps
  void addApps(IApp[string] someApps);
  void addApps(IApp[] someApps...);
  void addApps(IApp[] someApps);

  // Add app
  bool addApp(IApp aApp);
  bool addApp(string aName, IApp aApp);

  // Update existing app
  bool updateApp(IApp aApp);
  bool updateApp(string aName, IApp aApp);

  // Remove existing app
  bool removeApp(IApp aApp);
  bool removeApp(string aName);
}