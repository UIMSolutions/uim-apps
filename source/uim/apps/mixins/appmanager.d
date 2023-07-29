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
  // #endregion app

  bool hasApp(IApp aApp) {
    return (aApp ? hasApp(aApp.name) : false);
  }
  bool hasApp(string aName) {
    return (appContainer ? !(appContainer[aName] is null) : false);
  }

  // #region Add apps
    void addApps(IApp[string] someApps) {
      someApps.byKeyValue.each!(kv => addApp(kv.key, kv.value));
    }

    void addApps(IApp[] someApps...) {
      this.addApps(someApps.dup);
    }
    void addApps(IApp[] someApps) {
      someApps.each!(myApp => addApp(myApp));
    }
  // #endregion Add apps

  // Add app if not exitst
  bool addApp(IApp aApp) {
    debug writeln(" bool addApp(IApp aApp)");
    return (aApp ? addApp(aApp.name, aApp) : false);
  }
  bool addApp(string aName, IApp aApp) {
    debug writeln(aName);    
    if (aApp) {
      debug writeln("this "~(this ? "exists" : "missing"));    
      aApp.manager(this);
      debug writeln("manager "~(App.manager ? "exists" : "missing"));    
    }
    if (appContainer) {
      appContainer.add(aName, aApp);
      return true;
    }
    return false;
  }

  // Update existing app
  bool updateApp(IApp aApp) {
    return (aApp ? updateApp(aApp.name, aApp) : false);
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