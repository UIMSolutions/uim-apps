module uim.apps.applications.application;

@safe:
import uim.apps;

class DAPPApplication {
  this() { 
    debug writeln("this()");
    this
      .links(APPLinkContainer) 
      .metas(APPMetaContainer) 
      .scripts(APPScriptContainer) 
      .styles(APPStyleContainer); 
  }

  this(DAPPLayout mylayout) {
    debug writeln("this(myLayout)");
    this().layout(mylayout); }

  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("size_t", "versionNumber"));
  mixin(OProperty!("DETBBase", "database"));
  mixin(OProperty!("DAPPLayout", "layout"));
  mixin(OProperty!("STRINGAA", "parameters"));
  mixin(OProperty!("Json", "config"));

  // Containers
  mixin(OProperty!("DAPPLinkContainer", "links"));
  mixin(OProperty!("DAPPMetaContainer", "metas"));
  mixin(OProperty!("DAPPScriptContainer", "scripts"));
  mixin(OProperty!("DAPPStyleContainer", "styles"));

  mixin(OProperty!("DAPPControllerRegistry", "controllers"));  
  DAPPController controller(string path) {
    return controllers ? controllers[path] : null; 
  }
  O controller(this O)(string path, DAPPController newController) {
    if (controllers) controllers[path] = newController;
    return cast(O)this; 
  }

  mixin(OProperty!("DAPPViewRegistry", "views"));  
  DAPPView view(string path) {
    return views ? views[path] : null; 
  }
  O view(this O)(string path, DAPPView newView) {
    if (views) controlleviewsrs[path] = newView;
    return cast(O)this; 
  }
}
auto APPApplication() { return new DAPPApplication; }
auto APPApplication(DAPPLayout myLayout) { return new DAPPApplication(myLayout); }

/* class DAPPApplication  {
	this() { super(); }

	mixin(OProperty!("DETBBase", "database"));

/*   mixin(OProperty!("DAPPSecurityController", "securityController")); 
  mixin(OProperty!("DAPPSecurityOptions", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(APPSecurityOptions(newOptions)); return cast(O)this; }  

  override void afterInsertObj(DAPPController appObject) {
    super.afterInsertObj(appObject);

    if (auto page = cast(DAPPPage)appObject) {
      if (!page.securityController) page.securityController(securityController.copy.page(page));
      if (!page.securityOptions) page.securityOptions(securityOptions.copy);
    }
  }
 * /
}
auto APPUIM() { return new DAPPUIM(); }
auto APPUIM(string aName) { return APPUIM.name(aName); }
auto APPUIM(string aName, string aRootPath) { return APPUIM(aName).rootPath(aRootPath); }

 */