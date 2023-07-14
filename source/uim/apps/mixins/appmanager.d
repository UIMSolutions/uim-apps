module uim.apps.mixins.appmanager;

import uim.apps;
@safe:

mixin template AppContainerTemplate() {
  // #region appContainer
  protected DAppContainer _appContainer;  
  DAppContainer appContainer() {
    if (_appContainer) return _appContainer;
    return (_manager ? manager.appContainer : null); 
  }  
  O appContainer(this O)(DAppContainer aAppContainer) {    
    _appContainer = aAppContainer;
    return cast(O)this;
  }  
  // #endregion appContainer
}

mixin template AppManagerTemplate() {
  // #region apps
    void apps(IApp[string] someApps) {
      someApps.byKeyValue.each!(kv => app(kv.key, kv.value));
    }

    void apps(IApp[] someApps...) {
      apps(someApps.dup);
    }

    void apps(IApp[] someApps) {
      someApps.each!(col => app(col));
    }

    IApp[] apps() { 
      return (appContainer ? appContainer.values : null); 
    }
    string[] appNames() {
      return (appContainer ? appContainer.keys : null);
    }
  // #endregion apps


  // #region app
    IApp app(string aName = null) {
      return (appContainer ? (aName ? appContainer[aName] : null) : null);
    }   

    void app(IApp aApp) {
      if (aApp) app(aApp.name, aApp);
    }
    void app(string aName, IApp aApp) {
      if (appContainer) appContainer[aName] = aApp;
    }
  // #endregion app

  bool hasApp(IApp aApp) {
    return (aApp ? hasApp(aApp.name) : false);
  }
  bool hasApp(string aName) {
    return (appContainer ? !(appContainer[aName] is null) : false);
  }

  // #region Add apps
  O addApps(this O)(IApp[] someApps...) {
    this.addApps(someApps.dub);
    return cast(O)this;
  }
  O addApps(this O)(IApp[] someApps) {
    someApps.each!(app => addApp(app));
    return cast(O)this;
  }

  // Add app if not exitst
  void addApp(IApp aApp) {
    if (aApp) addApp(aApp.name, aApp);
  }
  void addApp(string aName, IApp aApp) {
    if (appContainer && aApp && !hasApp(aName)) appContainer.add(aName, aApp);
  }

  // Update existing app
  void updateApp(IApp aApp) {
     if (aApp) updateApp(aApp.name, aApp);
  }
  void updateApp(string aName, IApp aApp) {
    if (aApp && hasApp(aName)) appContainer.update(aName, aApp);
  }

  // Remove existing app
  void removeApp(IApp aApp) {
    if (aApp) removeApp(aApp.name);
  }
  void removeApp(string aName) {
    if (appContainer && hasApp(aName)) appContainer.remove(aName);
  }
}