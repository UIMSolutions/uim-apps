module uim.apps.layouts.layout;

@safe:
import uim.apps;

enum DataModes { Local, REST }

class DAPPLayout {
  this() { initialize(); }

  void initialize() {
    this
      .name("APPLayout")
      .title("UI Manufaktur")
      .bodyAttributes(["style": "background-color: #ffffff;"])
      .layoutStyle("tabler")
      .links(APPLinkContainer) 
      .metas(APPMetaContainer) 
      .scripts(APPScriptContainer)
      .styles(APPStyleContainer); 

    if (layoutStyle == "tabler") {
      this.styles.addLinks(
        "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css",
        "https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap",
        "/lib/tabler/last/css/tabler.min.css",
        "/lib/tabler/last/css/tabler-flags.min.css",
        "/lib/tabler/last/css/tabler-payments.min.css",
        "/lib/tabler/last/css/tabler-vendors.min.css");

      this.scripts.addLinks(
        "/lib/apexcharts/last/apexcharts.min.js",
        "/lib/tabler/last/js/tabler.min.js");
    }
    
    this.metas.add(
      ["charset":"utf-8"],
      ["http-equiv":"X-UA-Compatible", "content":"IE=edge"],
      ["name":"viewport", "content":"width=device-width, initial-scale=1"], 
      ["http-equiv":"Content-Type", "content":"text/html; charset=utf-8"],
      ["name":"msapplication-TileColor", "content":"#ffffff"],
      ["name":"msapplication-TileImage", "content":"/ms-icon-144x144.png"],
      ["name":"theme-color", "content":"#ffffff"]      
      //["rel":"icon", "type":"image/ico", "href":"/img/favicon.ico"],
      );

    this.styles.addLinks(
      "/lib/kothing/last/kothing-editor.min.css",
      "/lib/katex/last/katex.min.css",
      "/css/apps/app.css",
      "/css/apps/cms/main.css");

    this.scripts.addLinks(
      "/lib/kothing/last/kothing-editor.min.js",
      "/lib/katex/last/katex.min.js",
      "/js/apps/app.js");

    _bodyAttributes["style"] = "background-color: #ffffff;";
    _bodyClasses = ["d-flex", "flex-column", "h-100"];

    this
    .navigation(APPNavigation.fixedTop(true))
    .footer(APPPageFooter);
  }

  mixin(OProperty!("DAPPNavigation", "navigation"));
  mixin(OProperty!("DAPPPageFooter", "footer"));
  mixin(OProperty!("string", "layoutStyle"));
  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string", "language"));
  mixin(OProperty!("STRINGAA", "headAttributes"));
  mixin(OProperty!("string[]", "headClasses"));
  mixin(OProperty!("STRINGAA", "bodyAttributes"));
  mixin(OProperty!("string[]", "bodyClasses"));
  mixin(OProperty!("STRINGAA", "parameters"));
  mixin(OProperty!("DAPPLayout", "layout"));
  mixin(OProperty!("Json", "config"));

  protected DAPPApplication _app;
  DAPPApplication app() {
    if (_app) return _app;
    return null;
  }
  O app(this O)(DAPPApplication newApp) {
    _app = newApp;
    return cast(O)this;
  }

  // Containers
  mixin(OProperty!("DAPPLinkContainer", "links"));
  mixin(OProperty!("DAPPMetaContainer", "metas"));
  mixin(OProperty!("DAPPScriptContainer", "scripts"));
  mixin(OProperty!("DAPPStyleContainer", "styles"));

  string opIndex(string key) {
    switch(key) {
      case "title": return this.title;
      default: return "";
    }
  }

  void opIndexAssign(string value, string key) {
    switch(key) {
      case "title": this.title = value; break;
      default: break;
    }
  }

// #region render
	void beforeRender(STRINGAA options = null) {
		debugMethodCall(moduleName!DAPPLayout~":DAPPLayout::beforeRender");
	}

	string render(DAPPPageController controller, DAPPView view, STRINGAA options = null) { 
		debugMethodCall(moduleName!DAPPLayout~":DAPPLayout::render(DAPPPageController controller, DAPPView view, STRINGAA options = null)");
    if (view) {
      debug writeln("view is -> ", view.name);
		  return render(controller, view.toH5(options), options);
    }
    debug writeln("view is missing ");
    return render(controller, "", options);
	}

	string render(DAPPPageController controller, DH5Obj[] h5Objs, STRINGAA options = null) { 
		debugMethodCall(moduleName!DAPPLayout~":DAPPLayout::render(DAPPPageController controller, DH5Obj[] h5Objs, STRINGAA options = null)");
		if (h5Objs) {
      return render(controller, h5Objs.map!(h5 => h5.toString).join, options);
    }
    return render(controller, "", options);
	}

	string render(DAPPPageController controller, string content, STRINGAA options = null) { 
		debugMethodCall(moduleName!DAPPLayout~":DAPPLayout::render(DAPPPageController controller, string content, STRINGAA options = null)");
		beforeRender(options);

		// 1. page parameters to options
    if (controller) {
      debug writeln("controller is -> ", controller.name);
		  foreach(k,v; controller.parameters) options[k] = v; 
    }
    else { debug writeln("No controller"); }

		// 2. layout parameters to options
		foreach(k,v; parameters) if (k !in options) options[k] = v;
		// 3. app parameters to options
		
		if (app) {
			options["rootPath"] = app.rootPath;      
			foreach(k,v; app.parameters) if (k !in options) options[k] = v; }

    DH5Obj[] actualMetas;
    DH5Obj[] actualLinks;
    DH5Obj[] actualStyles;
		DH5Obj[] actualScripts;

		if (app) {
      debug writeln("Found app");

      actualMetas ~= app.metas.toH5;
			actualLinks ~= app.links.toH5;
			actualStyles ~= app.styles.toH5;
			actualScripts ~= app.scripts.toH5;
		} else { debug writeln("No app :-("); }

    actualMetas ~= this.metas.toH5;
    actualLinks ~= this.links.toH5;
    actualStyles ~= this.styles.toH5;
    actualScripts ~= this.scripts.toH5;

		if (auto pageController = cast(DAPPPageController)controller) {
      debug writeln("Found pageController");

      actualMetas ~= pageController.metas.toH5;
			actualLinks ~= pageController.links.toH5;
			actualStyles ~= pageController.styles.toH5;
			actualScripts ~= pageController.scripts.toH5;
		} else { debug writeln("No pageController :-("); }

		// creating HTML page
		auto _html = H5Html
		.attributes("lang", options.get("lang", "en")).attributes("dir", options.get("dir", "ltr"));
		
    // Head part of HTML
    auto headContent = 
      (options.get("title", null) ? "<title>" ~ options.get("title", null) ~ "</title>":null)~
		  (actualMetas.asString~options.get("metas", null))~
		  (actualLinks.asString~options.get("links", null))~
		  ("link" in options ? options["link"] : null)~
		  (actualStyles.asString~options.get("styles", null))~
		  ("style" in options ? H5Style(options["style"]).toString : null);
		renderHead(_html, this.headClasses, this.headAttributes, headContent, options);

		// Body part of HTML
		auto bodyContent = 
    (this.layout ?  this.layout.render(controller, content, options) : content)~
		(actualScripts.asString~options.get("script", null));

		renderBody(_html, this.bodyClasses, this.bodyAttributes, bodyContent, options);

		return _html.toString;
	}
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
		// writeln(H5AppLayout);
		// assert(H5AppLayout.render == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		//assert(H5AppLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}}

  void renderHead(DH5Html html, string[] classes, STRINGAA attributes, string content, STRINGAA options = null) {
    html
    .head(classes)
		.head(attributes)
		.head(content);
  }

  void renderBody(DH5Html html, string[] classes, STRINGAA attributes, string content, STRINGAA options = null) {
    html
    .body_(classes)
		.body_(attributes)
		.body_(content);
  }
  // #endregion render
}

/*   override string render(DAPPPageController page, DAPPView view, STRINGAA options = null) {
    super.render(page, view, options);

    auto head = ("navigation" in options ? options.get("navigation", "") : navigation.render(options));
    // debug writeln("Head -> ", head);

        /* (this.layout ?  
          this.layout.toString(page.toH5(reqParameters), reqParameters).toString : 
          page.page.toH5(reqParameters).toString)) * /
    // debug writeln("pageBody -> ", pageBody);

    auto foot = "footer" in options ? options.get("footer", "") : footer.render(options);
    // debug writeln("foot -> ", foot);

    // debug writeln("return layout");
    auto pg = cast(DAPPPage)page;
    auto pHeader = pg ? pg.pageHeader : null;

 */    /*         BS5Container.fluid()(
            H5Div(["page-header d-print-none"], 
              BS5Row(["align-items-center row"])
              .col(["col"],
                H5Div("pageBreadcrumbs", [BreadcrumbsStyle], "XXX"), H5H2(["page-title"], "YYY"))
              .col(["col-auto ms-auto d-print-none"], 
                H5Div(["btn-list"], 
                  H5Span(["d-none d-sm-inline"], 
                    BS5Button(["btn-white"], "New view")),
                    BS5ButtonLink(["btn-primary d-none d-sm-inline-block"], ["data-bs-target":"#modal-report", "data-bs-toggle":"modal", 
                      "href":"#", "style":"background-color:#35A6FF"], tablerIcon("add")~"Create new report"))))).toString~
 */        



/*    this() { super(); 
      _bodyAttributes["style"] = "background-color: #ffffff;";

      this
      .metas(
        ["charset":"utf-8"],
        ["http-equiv":"X-UA-Compatible", "content":"IE=edge"],
        ["name":"viewport", "content":"width=device-width, initial-scale=1"], 
        ["http-equiv":"Content-Type", "content":"text/html; charset=utf-8"],
        )
      .links(
        ["rel":"icon", "type":"image/ico", "href":"/img/favicon.ico"],
        )
      .styles(
        ["href":"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css", "rel":"stylesheet"],
        ["href":"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap", "rel":"stylesheet"],
        )
      .scripts(
        ["src":"/lib/apexcharts/last/apexcharts.min.js"],
        ["src":"/lib/tabler/last/js/tabler.min.js"],
        )
      .title(
        "UIM!Central");    
    }

    mixin(OProperty!("DAPPNavbarSlot[]", "slots"));

    override DH5Obj navbar() {
      return BS5NavbarNav(this.navSlots);
    }

    override string toString(DAPPPageController page, string[string] reqParameters) {
      foreach(k,v; parameters) if (k !in reqParameters) reqParameters[k] = v;
      foreach(k,v; page.parameters) if (k !in reqParameters) reqParameters[k] = v;
      if (auto app = page.app) {
        foreach(k, v; app.parameters) if (k !in reqParameters) reqParameters[k] = v;
        reqParameters["rootPath"] = app.rootPath;   }

      return super.toString(page,    
        H5Div(["page mt-md-5"], ["style":"background-color:#ffffff;"], 
          ("navigation" in reqParameters ? reqParameters["navigation"] : navigation(reqParameters))~ 
          H5Div( 
            H5Main(["style":"margin-top:80px;"], 
              (this.layout ?  this.layout.toString(page.content(reqParameters), reqParameters) : page.content(reqParameters))).toString~
            ("footer" in reqParameters ? reqParameters["footer"] : footer(reqParameters))
          ).toString
        ).toString, 
        reqParameters); 
    }
}

auto navigation(string[string] reqParameters) {
  auto rootPath = reqParameters.get("rootPath", "/");

  return 
H5Header(["navbar navbar-expand-md navbar-light d-print-none fixed-top"],
  H5Div(["container-fluid"], 
    BS5NavbarToggler(["data-bs-target":"#navbar-menu"], 
      H5Span(["navbar-toggler-icon"])),
    H5H1(["navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3"],
      H5A(["href":"."],
        H5Img(["src":"/img/uim.png", "width":"110", "height":"32", "alt":"Tabler", "class":"navbar-brand-image"]))),
    //   
    H5Div(["navbar-nav flex-row order-md-last"], 
      // Login
      (reqParameters.get("login", "").empty ?
        H5Div(["nav-item d-none d-md-flex me-3"], 
        H5A(["btn btn-outline-info"], ["href":"/login"],
          tablerIcon("login")~"Login")).toString :
      // User       
        H5Div(["nav-item dropdown d-none d-md-flex me-3"], 
          H5A(["nav-link px-0"], ["href":"#", "data-bs-toggle":"dropdown", "tabindex":"-1", "aria-label":"Show notifications"], 
            tablerIcon("messages")~`<span class="badge bg-red"></span>`
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
        ).toString
      )
    )
  )
).toString~
H5Div(["navbar-expand-md fixed-top"], ["style":"top:50px;"], 
  H5Div("navbar-menu", ["collapse navbar-collapse"],
    H5Div(["navbar  navbar-dark bg-primary"],
      H5Div(["container-fluid"],
        BS5NavbarNav(
          BS5NavItem(
            BS5NavLink(["href":"/"], BS5NavLinkTitle("Home")),
          // Company Dropdown
          BS5NavItem(["dropdown"], 
            BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("Company")),
            BS5DropdownMenu
              .link(["href":"/company"], "Übersicht")
              .divider
              .link(["href":"/company/about"], "Über uns")
              .link(["href":"/company/targets"], "Unsere Ziele")
              .link(["href":"/company/impressum"], "Impressum")
              .link(["href":"/company/privacy"], "Datenschutzerklärung")
              .link(["href":"/company/agb"], "AGBs")
              .link(["href":"/company/contact"], "Kontakt")),
          ),
          BS5NavItem(["dropdown"], 
            BS5NavLink(["dropdown-toggle"], ["href":"#navbar-extra", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], BS5NavLinkTitle("Infos")),
            BS5DropdownMenu(
              BS5DropdownMenuColumns(
                BS5DropdownMenuColumn    
                  .header("Bereiche")
                  .link(["href":rootPath~"blogs"], "Blogs")
                  .link(["href":rootPath~"documentations"], "Dokumentation")
                  .link(["href":rootPath~"news"], "News")
                  .link(["href":rootPath~"tutorials"], "Tutorials")
                  .link(["href":rootPath~"keywords"], "Keywords"),
                BS5DropdownMenuColumn
                  .header("Themen")
                  /* (themes) * /
              )
          )
        )
      )
    )
  ))).toString; 
 }

string footer(STRINGAA reqParameters) {
  auto rootPath = reqParameters.get("rootPath", "/");

  return H5Footer(["py-5 bg-dark mt-2"], ["style":"background-color:#14a1b7"], 
    BS5Container.fluid()(
      H5P(["m-0 text-center text-white"], `Verantwortlich für den Inhalt gemäß § 6 MDStV`), 
      H5P(["m-0 text-center text-white"], `ui-manufaktur.com ist ein Einzelunternehmen:<br>
            UI Manufaktur UG (haftungsbeschränkt) - Inhaberin: Brigitte Straßer<br>
            Dreimühlenstraße 30 - 80469 München<br>
            Tel.: 0159 0508 4318 - Email: contact@ui-manufaktur.com<br>	 	
            Amtsgericht	München - HRB: 233911 - USt-IdNr.: DE313841646`),
      H5P(["m-0 text-center text-white"], "Copyright &copy; 2017 - 2021 UI Manufaktur UG"))).toString;
}

auto newNavbar(string[string] Parameters) {
// `<nav class="`~parameters.get("navClasses", "navbar navbar-expand-lg bg-info fixed-top")~`>

    return 
  `<nav class="navbar navbar-expand-lg bg-info fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/">`~H5Img(["height":"40", "src":"/img/logo.png", "alt":"UI Manufaktur"]).toString~`</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="sr-only">Toggle navigation</span>
      <span class="navbar-toggler-icon"></span>
      <span class="navbar-toggler-icon"></span>
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCompany" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              UI Manufaktur
            </a>`~
            BS5DropdownMenu(["aria-labelledby":"navbarDropdownCompany"]) 
            .link(["href":"/company"], "Übersicht")
            .divider
            .link(["href":"/company/about"], "Über uns")
            .link(["href":"/company/targets"], "Unsere Ziele")
            .link(["href":"/company/impressum"], "Impressum")
            .link(["href":"/company/privacy"], "Datenschutzerklärung")
            .link(["href":"/company/agb"], "AGBs")
            .link(["href":"/company/contact"], "Kontakt").toString~ 
          `</li>`~
          H5Li(["nav-item", "dropdown"], 
            `<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownDemos" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Demos
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownDemos">
              <a class="dropdown-item" href="/demos">Übersicht</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="/demos/uim-bootstrap">uim-bootstrap</a>
              <a class="dropdown-item" href="/demos/uim-components">uim-components</a>
              <a class="dropdown-item" href="/demos/uim.ecm">UIM!ECM</a>
              <a class="dropdown-item" href="/demos/uim.grundschutz">UIM!Grundschutz</a>
              <a class="dropdown-item" href="/demos/uim.mail">UIM!Mail</a>
              <a class="dropdown-item" href="/demos/uim.snake">UIM!Snake</a>
            </div>`).toString~
        `</ul>
      </div>
    </div>
  </nav>`;
}
// megamenu2
auto dropDownItems(string prefix, DAPPPageController[][string] themes) {
  string result;
  foreach(theme; themes.getKeys(true)) result ~= H5A(["dropdown-item"], ["href":prefix~theme.toLower], theme).toString;
  return result;
}
*/