module uim.apps.views.components.navbars.navigation;

@safe:
import uim.apps;

class DAPPNavigation : DAPPViewComponent {
  this() { super(); 
    this
    .firstNavbar(APPFirstNavbar)
    .secondNavbar(APPSecondNavbar);
  }

  mixin(SProperty!("DAPPFirstNavbar", "firstNavbar"));
  mixin(SProperty!("DAPPSecondNavbar", "secondNavbar"));
  mixin(SProperty!("bool", "fixedTop"));
  
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError) { return; }

    debug writeln(moduleName!DAPPNavigation~":DAPPNavigation::toH5");
    auto rootPath = options.get("rootPath", "/");
    debug writeln(moduleName!DAPPNavigation~":DAPPNavigation::toH5 -> appSessionId = ", options.get("appSessionId", ""));

    auto fNavbar = firstNavbar ? firstNavbar.toH5(options) : null;
    // debug writeln("firstNavbar -> ", fNavbar);
    auto sNavbar = secondNavbar ? secondNavbar.brand(["link":rootPath, "title":options.get("appTitle", "")]).toH5(options) : null;
    // debug writeln("secondNavbar -> ", sNavbar);

    // debug writeln("return navigation...");

    if (fixedTop) _h5Content ~= H5Div(["sticky-top"], fNavbar~sNavbar);
    else _h5Content ~= fNavbar~sNavbar;
  }
}
auto APPNavigation() { return new DAPPNavigation; }
