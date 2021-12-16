module uim.apps.apps;

@safe:
import uim.apps;

class DAPPUIM : DH5App {
	this() { super(); }

	mixin(OProperty!("DETBBase", "database"));

/*   mixin(SProperty!("DAPPSecurityController", "securityController")); 
  mixin(SProperty!("DAPPSecurityOptions", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(APPSecurityOptions(newOptions)); return cast(O)this; }  

  override void afterInsertObj(DH5AppController appObject) {
    super.afterInsertObj(appObject);

    if (auto page = cast(DAPPPage)appObject) {
      if (!page.securityController) page.securityController(securityController.copy.page(page));
      if (!page.securityOptions) page.securityOptions(securityOptions.copy);
    }
  }
 */
}
auto APPUIM() { return new DAPPUIM(); }
auto APPUIM(string aName) { return APPUIM.name(aName); }
auto APPUIM(string aName, string aRootPath) { return APPUIM(aName).rootPath(aRootPath); }

