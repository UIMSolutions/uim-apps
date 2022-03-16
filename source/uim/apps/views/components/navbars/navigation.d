module uim.apps.views.components.navbars.navigation;

@safe:
import uim.apps;

class DAPPNavigation : DViewComponent {
  this() { super(); 
    this
    .firstNavbar(APPFirstNavbar)
    .secondNavbar(APPSecondNavbar);
  }

  this(DAPPView myView) { 
    this().view(myView);
  }

  mixin(APPViewProperty!("DAPPFirstNavbar", "firstNavbar"));
  mixin(APPViewProperty!("DAPPSecondNavbar", "secondNavbar"));
  mixin(OProperty!("bool", "fixedTop"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    debug writeln(moduleName!DAPPNavigation~":DAPPNavigation::toH5");
    auto rootPath = options.get("rootPath", "/");
    debug writeln(moduleName!DAPPNavigation~":DAPPNavigation::toH5 -> appSessionId = ", options.get("appSessionId", ""));

    auto fNavbar = firstNavbar  ? firstNavbar.toH5(options) 
                                : null;
    // debug writeln("firstNavbar -> ", fNavbar);
    auto sNavbar = secondNavbar ? secondNavbar.brand(["link":rootPath, "title":options.get("appTitle", "")]).toH5(options) 
                                : null;
    // debug writeln("secondNavbar -> ", sNavbar);

    // debug writeln("return navigation...");

    if (fixedTop) return [H5Div(["sticky-top"], fNavbar~sNavbar)].toH5;
    return fNavbar~sNavbar;
  }
}
auto APPNavigation() { return new DAPPNavigation; }
auto APPNavigation(DAPPView myView) { return new DAPPNavigation(myView); }
