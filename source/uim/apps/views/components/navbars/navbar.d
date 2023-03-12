module uim.apps.views.components.navbars.navbar;

@safe:
import uim.apps;

/* class DAPPFirstNavbar : DViewComponent {
    this() { super(); }

    override DH5Obj[] toH5(STRINGAA options = null) {   
        auto loginMenu = 
        H5Div(["nav-item d-none d-md-flex me-3"], 
        H5A(["btn btn-outline-info"], ["href":"/login"],
          tablerIcon("login")~"Login")).toString;

        auto userMenu = H5Div(["nav-item dropdown d-none d-md-flex me-3"], 
          H5A(["nav-link px-0"], ["href":"#", "data-bs-toggle":"dropdown", "tabindex":"-1", "aria-label":"Show notifications"], 
            tablerIcon("home")~`<span class="badge bg-red"></span>`
          ), 
          BS5DropdownMenu(["dropdown-menu-end dropdown-menu-card"], 
            BS5Card
              .body_("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet consectetur exercitationem fugiat in ipsa ipsum, natus odio quidem quod repudiandae sapiente. Amet debitis et magni maxime necessitatibus ullam.")
          )).toString~
        H5Div(["nav-item dropdown"], 
          H5A(["nav-link d-flex lh-1 text-reset p-0"], ["href":"#", "data-bs-toggle":"dropdown", "aria-label":"Open user menu"],
            BS5Avatar(["avatar-sm"], ["style":"background-image: url(./static/avatars/000m.jpg)"]),
            H5Div(["d-none d-xl-block ps-2"],
              H5Div(reqParameters.get("user", "")),
              H5Div(["mt-1 small text-muted"], reqParameters.get("job", ""))
            )),
          BS5DropdownMenu(["dropdown-menu-end dropdown-menu-arrow"])
          .link(["href":"/user/status"], "Status")
          .link(["href":"/user/profile"], "Profile")
          .link(["href":"/user/feedback"], "Feedback")
          .divider
          .link(["href":"/user/settings"], "Einstellungen")
          .link(["href":"/logout"], "Logout")
        ).toString;

        return
            H5Header("firstNavbar", ["navbar navbar-expand-md navbar-light d-print-none fixed-top"],
                H5Div(["container-fluid"], 
                    BS5NavbarToggler(["data-bs-target":"#navbar-menu"], 
                    H5Span(["navbar-toggler-icon"])),
                    H5H1(["navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3"],
                      H5A(["href":".", "style":"color:skyblue;font-size:1.6em;"],
                          H5Img("uim-logo", ["navbar-brand-image"], ["src":"/img/uim.png", "width":"110", "height":"32", "alt":"UI Manufaktur", "style":"height:48px;"])),
                      H5Span(["display-6 align-text-bottom"], H5String(reqParameters.get("appTitle", "")))
                    ),
                    H5Div(["navbar-nav flex-row order-md-last"], 
                        (reqParameters.get("login", "").empty ? loginMenu : userMenu )
                    )
                )
            );
    }
}
auto APPFirstNavbar() { return new DAPPFirstNavbar; }

class DAPPSecondNavbar : DViewComponent {
  this() { super(); }

  mixin(OProperty!("DAPPNavbarSlot[]", "slots"));
  mixin(OProperty!("string[string]", "brand"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    auto container = BS5Container.fluid;
/*         if (brand) container(
        `<h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3"><a href="%s">%s</a></h1>`.format(brand.get("link","#"), brand.get("title", "")));
* /        
    container(
      BS5NavbarNav(["me-auto"],
          slots.map!(a => a.toString(reqParameters)).array.join()
      ));

    return
      H5Div("secondNavbar", ["navbar-expand-md fixed-top"], ["style":"top:70px;"], 
        H5Div("navbar-menu", ["collapse navbar-collapse"],
          H5Div(["navbar navbar-dark"], ["style":"background-color:#35A6FF"],
            container
          )
        )
      ); 
  }
}
auto APPSecondNavbar() { return new DAPPSecondNavbar; }
auto APPSecondNavbar(DAPPNavbarSlot[] slots) { return APPSecondNavbar.slots(slots); }
 */

class DAPPFirstNavbar : DViewComponent {
  mixin(ViewComponentThis!("APPFirstNavbar"));

  mixin(APPParameter!("appLogo"));
  mixin(APPParameter!("appTitle"));
  mixin(OProperty!("bool", "requiresLogin"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }

    auto isLogin = false;
    if (auto appSession = getAppSession(options)) {
      if (appSession.session) {
        isLogin = true;
      }
    }

    auto userButton = isLogin 
      ? H5Div(["navbar-nav flex-row order-md-last"], 
          messagesNavitem(options), userNavitem(options))
      : H5Div(["nav-item d-none d-md-flex me-3"])( 
          H5A(["btn btn-outline-info text-blue"], ["href":"/login"], tablerIcon("login")~"Login")); 

    return [  
      H5Header("topnavbar", ["navbar navbar-expand-md navbar-light d-print-none"], 
        H5Div(["container-fluid"], 
          H5Button(["navbar-toggler"], ["type":"button", "data-bs-toggle":"collapse", "data-bs-target":"#navbar-menu"],
            H5Span(["navbar-toggler-icon"])),
          H5H1(["navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3 text-blue"], 
            H5A(["p-3 ps-5"], 
              ["href":"/", "style":"background-repeat: no-repeat; background-position: left center;background-size: 60px auto; background-image:url(/img/logo.png)"], 
              this.appTitle)),
            userButton
          )               
        )
      ].toH5;
  }
}
mixin(ViewComponentCalls!("APPFirstNavbar"));


auto messagesNavitem(STRINGAA options = null) {
  return H5Div(["nav-item dropdown d-none d-md-flex me-3"], 
    H5A(["nav-link px-0"], ["href":"#", "data-bs-toggle":"dropdown", "tabindex":"-1", "aria-label":"Benachrichtigungen"], 
      H5String(tablerIcon("bell")), H5Span(["badge bg-red"])),
    H5Div(["dropdown-menu dropdown-menu-end dropdown-menu-card"], 
      BS5Card
      .body_(
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus ad amet consectetur exercitationem fugiat in ipsa ipsum, natus odio quidem quod repudiandae sapiente. Amet debitis et magni maxime necessitatibus ullam."
      )
    )
  );
}

auto userNavitem(STRINGAA options = null) {
  return 
    H5Div(["nav-item dropdown"], 
      H5A(["nav-link d-flex lh-1 text-reset p-0"], ["href":"#", "data-bs-toggle":"dropdown", "aria-label":"Benutzermenü"], 
        BS5Avatar(["avatar-sm"], ["style":"background-image: url(/lib/tabler/tabler-1.0.0-alpha.7/static/avatars/000m.jpg)"]),
        H5Div(["d-none d-xl-block ps-2"], 
          H5Div("Mr. APP"),
          H5Div(["mt-1 small text-muted"], "UI Designer")
        )
      ),
      H5Div(["dropdown-menu dropdown-menu-end dropdown-menu-arrow"], 
        BS5DropdownLink(["href":"#"], "Set status"),
        BS5DropdownLink(["href":"#"], "Profile & account"),
        BS5DropdownLink(["href":"#"], "Feedback"),
        H5Div(["dropdown-divider"]),
        BS5DropdownLink(["href":"#"], "Settings"),
        BS5DropdownLink(["href":"#"], "Logout")
      )
    );
}

class DAPPSecondNavbar : DViewComponent {
  mixin(ViewComponentThis!("APPSecondNavbar"));

  mixin(OProperty!("DAPPNavbarSlot[]", "leftSlots"));
  mixin(OProperty!("DAPPNavbarSlot[]", "rightSlots"));
  mixin(OProperty!("DAPPNavbarSlot[]", "leftSlotsWithLogin"));
  mixin(OProperty!("DAPPNavbarSlot[]", "rightSlotsWithLogin"));
  mixin(OProperty!("string[string]", "brand"));
  mixin(OProperty!("string[string]", "brandWithLogin"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }

    auto isLogin = false;
    if (auto appSession = getAppSession(options)) {
      if (appSession.session) {
        isLogin = true;
      }
    }

    string navLeftSlots;
    string navRightSlots;
    auto selNavitem = options.get("selNavitem", "");
    
    if (isLogin) {
      // debug writeln("has sessionId -> ", reqParameters.get("sessionId", ""));

      foreach(slot; this.leftSlotsWithLogin) {
        if (!slot) { continue; }
         //debug writeln(slot);
        const active = (selNavitem.length > 0) && (slot.id == selNavitem);
        slot.active(active);
        navLeftSlots ~= slot.toH5(options).toString;
      }

      foreach(slot; this.rightSlotsWithLogin) {
        if (!slot) { continue; }
         //debug writeln(slot);
        const active = (selNavitem.length > 0) && (slot.id == selNavitem);
        slot.active(active);
        navRightSlots ~= slot.toH5(options).toString;
      }
    }
    else { // no login
      foreach(slot; this.leftSlots) {
        if (!slot) { continue; }
         //debug writeln(slot);
        const active = (selNavitem.length > 0) && (slot.id == selNavitem);
        slot.active(active);
        navLeftSlots ~= slot.toH5(options).toString;
      }

      foreach(slot; this.rightSlots) {
        if (!slot) { continue; }
         //debug writeln(slot);
        const active = (selNavitem.length > 0) && (slot.id == selNavitem);
        slot.active(active);
        navRightSlots ~= slot.toH5(options).toString;
      }
    }
    // debug writeln("return content...");
    
    return [
      H5Div(["navbar-expand-md"], 
        H5Div("navbar-menu", ["collapse navbar-collapse"], 
          H5Div("navbar-2", ["navbar navbar-dark"], ["style":"background-color:#35A6FF"], 
            H5Div(["container-fluid"], 
              H5Ul("navbarnav-2left", ["navbar-nav"], 
                navLeftSlots
              ),
              H5Ul("navbarnav-2right", ["navbar-nav ms-auto"], 
                navRightSlots
              )
            )
          )
        )
      )].toH5;
  }
}
mixin(ViewComponentCalls!("APPSecondNavbar"));

/*
BS5NavItem(["active"], 
                BS5NavLink(["href":"./index.html"],
                  H5Span(["nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("home")),
                  H5Span(["nav-link-title"], "Home"))),
              BS5NavItem(["dropdown"], 
                H5A(["nav-link dropdown-toggle"], ["href":"#navbar-base", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], 
                  H5Span(["nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("package")),
                  H5Span(["nav-link-title"], "Interface")),
                H5Div(["dropdown-menu"], 
                  H5Div(["dropdown-menu-columns"], 
                    H5Div(["dropdown-menu-column"], 
                      BS5DropdownLink(["href":"./empty.html"], "Empty page"),
                      BS5DropdownLink(["href":"./accordion.html"], "Accordion"),
                      BS5DropdownLink(["href":"./blank.html"], "Blank page"),
                      BS5DropdownLink(["href":"./buttons.html"], "Buttons"),
                      BS5DropdownLink(["href":"./cards.html"], "Cards"),
                      BS5DropdownLink(["href":"./cards-masonry.html"], "Cards Masonry"),
                      BS5DropdownLink(["href":"./colors.html"], "Colors"),
                      BS5DropdownLink(["href":"./dropdowns.html"], "Dropdowns"),
                      BS5DropdownLink(["href":"./icons.html"], "Icons"),
                      BS5DropdownLink(["href":"./modals.html"], "Modals"),
                      BS5DropdownLink(["href":"./maps.html"], "Maps"),
                      BS5DropdownLink(["href":"./map-fullsize.html"], "Map fullsize"),
                      BS5DropdownLink(["href":"./maps-vector.html"], "Vector maps")
                    ),
                    H5Div(["dropdown-menu-column"], 
                      BS5DropdownLink(["href":"./navigation.html"], "Navigation"),
                      BS5DropdownLink(["href":"./charts.html"], "Charts"),
                      BS5DropdownLink(["href":"./pagination.html"], "Pagination"),
                      BS5DropdownLink(["href":"./skeleton.html"], "Skeleton"),
                      BS5DropdownLink(["href":"./tabs.html"], "Tabs"),
                      BS5DropdownLink(["href":"./tables.html"], "Tables"),
                      BS5DropdownLink(["href":"./carousel.html"], "Carousel"),
                      BS5DropdownLink(["href":"./lists.html"], "Lists"),
                      BS5DropdownLink(["href":"./typography.html"], "Typography"),
                      BS5DropdownLink(["href":"./markdown.html"], "Markdown"),
                      H5Div(["dropend"], 
                        BS5DropdownLink(["dropdown-toggle"], ["href":"#sidebar-authentication", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], "Authentication"),
                        H5Div(["dropdown-menu"], 
                          BS5DropdownLink(["href":"./sign-in.html"], "Sign in"),
                          BS5DropdownLink(["href":"./sign-up.html"], "Sign up"),
                          BS5DropdownLink(["href":"./forgot-password.html"], "Forgot password"),
                          BS5DropdownLink(["href":"./terms-of-service.html"], "Terms of service"),
                          BS5DropdownLink(["href":"./auth-lock.html"], "Lock screen")
                        )
                      ),
                      H5Div(["dropend"], 
                        BS5DropdownLink(["dropdown-toggle"], ["href":"#sidebar-error", "data-bs-toggle":"dropdown", "role":"button","aria-expanded":"false"], "Error pages"),
                        H5Div(["dropdown-menu"], 
                          BS5DropdownLink(["href":"./error-404.html"], "404 page"),
                          BS5DropdownLink(["href":"./error-500.html"], "500 page"),
                          BS5DropdownLink(["href":"./error-maintenance.html"], "Maintenance page")
                        )
                      )
                    )
                  )
                )
              ),
              BS5NavItem( 
                BS5NavLink(["href":"./form-elements.html"], 
                  H5Span(["nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("checkbox")),
                  H5Span(["nav-link-title"], "Form elements"))),
              BS5NavItem(["dropdown"], 
                H5A(["nav-link dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], 
                  H5Span(["nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("star")),
                  H5Span(["nav-link-title"], "Extra")),
                H5Div(["dropdown-menu"],
                  BS5DropdownLink(["href":"./activity.html"], "Activity"),
                  BS5DropdownLink(["href":"./gallery.html"], "Gallery"),
                  BS5DropdownLink(["href":"./invoice.html"], "Invoice"),
                  BS5DropdownLink(["href":"./search-results.html"], "Search results"),
                  BS5DropdownLink(["href":"./pricing.html"], "Pricing cards"),
                  BS5DropdownLink(["href":"./users.html"], "Users"),
                  BS5DropdownLink(["href":"./license.html"], "License"),
                  BS5DropdownLink(["href":"./music.html"], "Music"),
                  BS5DropdownLink(["href":"./widgets.html"], "Widgets"),
                  BS5DropdownLink(["href":"./wizard.html"], "Wizard"))
              ),
              BS5NavItem(["dropdown"], 
                H5A(["nav-link dropdown-toggle"], ["href":"#navbar-layout", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], 
                  H5Span(["nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("layout-2")),
                  H5Span(["nav-link-title"], "Layout")
                ),
                H5Div(["dropdown-menu"], 
                  H5Div(["dropdown-menu-columns"], 
                    H5Div(["dropdown-menu-column"], 
                      BS5DropdownLink(["href":"./layout-horizontal.html"], "Horizontal"),
                      BS5DropdownLink(["href":"./layout-vertical.html"], "Vertical"),
                      BS5DropdownLink(["href":"./layout-vertical-transparent.html"], "Vertical transparent"),
                      BS5DropdownLink(["href":"./layout-vertical-right.html"], "Right vertical"),
                      BS5DropdownLink(["href":"./layout-condensed.html"], "Condensed"),
                      BS5DropdownLink(["href":"./layout-condensed-dark.html"], "Condensed dark"),
                      BS5DropdownLink(["href":"./layout-combo.html"], "Combined"),
                    ),
                    H5Div(["dropdown-menu-column"], 
                      BS5DropdownLink(["href":"./layout-navbar-dark.html"], "Navbar dark"),
                      BS5DropdownLink(["href":"./layout-navbar-sticky.html"], "Navbar sticky"),
                      BS5DropdownLink(["href":"./layout-navbar-overlap.html"], "Navbar overlap"),
                      BS5DropdownLink(["href":"./layout-dark.html"], "Dark mode"),
                      BS5DropdownLink(["href":"./layout-rtl.html"], "RTL mode"),
                      BS5DropdownLink(["href":"./layout-fluid.html"], "Fluid"),
                      BS5DropdownLink(["href":"./layout-fluid-vertical.html"], "Fluid vertical"),
                    )
                  )
                )
              ),
              BS5NavItem(
                BS5NavLink(["href":"./docs/index.html"], 
                  H5Span(["nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("file-text")),
                  H5Span(["nav-link-title"], "Documentation")))
            ),
            H5Div(["my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last"],
              H5Form(["action":".", "method":"get"], 
                H5Div(["input-icon"], 
                  H5Span(["input-icon-addon"], tablerIcon("search", ["text-blue"])),
                  UIMTextInput(["bg-white"], ["placeholder":"Search…", "aria-label":"Search in website"])
                )
              )
*/