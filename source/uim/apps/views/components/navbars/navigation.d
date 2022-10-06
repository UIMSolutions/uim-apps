module uim.apps.views.components.navbars.navigation;

@safe:
import uim.apps;

class DAPPNavigation : DAPPViewComponent {
  mixin(ViewComponentThis!("APPNavigation"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPNavigation~"::DAPPNavigation("~this.name~"):initialize");   
    super.initialize;

    debug writeln("Add First Nav");
    this
      .firstNavbar(APPFirstNavbar);

    debug writeln("Add Second Nav");
    this
      .secondNavbar(APPSecondNavbar);
  }

  mixin(OProperty!("DAPPViewComponent", "firstNavbar"));
  mixin(OProperty!("DAPPViewComponent", "secondNavbar"));
  mixin(OProperty!("bool", "fixedTop"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    debug writeln(moduleName!DAPPNavigation~":DAPPNavigation::toH5");
    auto rootPath = options.get("rootPath", "/");
    debug writeln(moduleName!DAPPNavigation~":DAPPNavigation::toH5 -> appSessionId = ", options.get("appSessionId", ""));

    auto firstNavbarH5 = this.firstNavbar   ? this.firstNavbar.toH5(options) 
                                            : null;
    debug writeln(firstNavbar ? "Has firstNavbar" : "Missing firstNavbar");
    debug writeln("firstNavbar -> ", firstNavbarH5);
    auto secNavbar = cast(DAPPSecondNavbar)this.secondNavbar;
    debug writeln(secondNavbar ? "Has secondNavbar" : "Missing secondNavbar");
    auto secondNavbarH5 = secNavbar ? secNavbar.brand(["link":rootPath, "title":options.get("appTitle", "")]).toH5(options) 
                                          : null;
    debug writeln("secondNavbar -> ", secNavbar);

    debug writeln("return navigation...");

    if (fixedTop) return [H5Div(["sticky-top"], firstNavbarH5~secondNavbarH5)].toH5;
    return firstNavbarH5~secondNavbarH5;
  }
}
mixin(ViewComponentCalls!("APPNavigation"));
