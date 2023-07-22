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
      someApps.each!(myApp => this.app(myApp));
    }

    IApp[] apps() { 
      debug writeln ("APpContainer %s".format(appContainer ? "exists" : "missing"));
      auto myApps = appContainer.values;
      debug writeln ("Found %s apps".format(myApps.length));
      return (appContainer ? appContainer.values : null); 
    }
    string[] appNames() {
      debug writeln ("APpContainer %s".format(appContainer ? "exists" : "missing"));
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
      if (appContainer) {
        appContainer[aName] = aApp;
      }
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
    debug writeln ("Adding Apps %s".format(someApps.length));
    someApps.each!(app => addApp(app));
    return cast(O)this;
  }

  // Add app if not exitst
  void addApp(IApp aApp) {
    if (aApp) addApp(aApp.name, aApp);
  }
  void addApp(string aName, IApp aApp) {
    debug writeln ("Adding App ", aName);
    if (appContainer) appContainer.add(aName, aApp);
    else debug writeln("Missing AppContainer");
  }

  // Update existing app
  bool updateApp(IApp aApp) {
    if (aApp) return updateApp(aApp.name, aApp);
    return false;
  }
  bool updateApp(string aName, IApp aApp) {
    if (appContainer) {
      appContainer.update(aName, aApp);
      return true;
    }
    return false;
  }

  // Remove existing app
  bool removeApp(IApp aApp) {
    return (aApp ? removeApp(aApp.name) : false);
  }
  bool removeApp(string aName) {
    if (appContainer) {
      appContainer.remove(aName);
      return true;
    }
    return false;
  }
}