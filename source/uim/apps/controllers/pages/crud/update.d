module uim.apps.controllers.pages.crud.update;
/**************************************************/
/* This package contains general edit page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPEntityUpdateController : DAPPEntityCrudPageController {
  mixin(APPPageControllerThis!("APPEntityUpdateController"));
  
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
  
    this
      .view(APPEntityUpdateView)
      .scripts
        .addLinks(         
          "/js/apps/entities/entity.js", 
          "/js/apps/entities/edit.js", // deprecated
          "/js/apps/entities/update.js");
  }

  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js", 
      "/js/apps/entities/"~entityName~"/edit.js", // deprecated
      "/js/apps/entities/"~entityName~"/update.js");
  }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPEntityUpdateController~":DAPPEntityUpdateController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) return;

    auto appSession = getAppSession(options);

    this.entity(database[appSession.site, collectionName].findOne(options.toEntitySelect));
    if (!entity) {
      // TODO Errorhandling
      return;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);
  
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }

    if (viewMode == ViewModes.JS) {
      options["script"] = options.get("script", "")~
`window.addEventListener('load', (event) => {
  document.getElementById("Form").addEventListener("submit", event => {
    event.preventDefault();
    editEntity();
  })
});`;
    }
  }
}  
mixin(APPPageControllerCalls!("APPEntityUpdateController"));

/* class DAPPUpdatePage : DAPPPage {
    this() { super(); 
      this
      .title("ADMIN!CMS - Themes - Edit")
        ["src":"/js/apps/cms/app.js"],
      ["src":"/js/apps/"~myJsPath~"/entity.js"],
        ["src":"/js/apps/"~myJsPath~"/edit.js"])    
      .scripts(
        `let editor_text; let editor_summary;`);
    }

/*    override DH5Obj[] toH5(STRINGAA reqParameters) { 
      // debug writeln(StyledString("In "~_request.path~"-DAPPUpdatePage:toJson...").setForeground(AnsiColor.green).setBackground(AnsiColor.white));

      auto json = this.app.database.findOne("siteName", "myPool", urlToSelect(reqParameters));
      auto entity = OOPEntity;

      auto tabpanes = APPPanes(entity);
      tabpanes.panes([
          APPPaneGeneral(entity),
          APPPaneVersions(entity),
          APPPaneHistory(entity)
      ]); */

/*       .panes(
        ACGeneralPane("general", "General", "/themes"),
        ACTabpane("specific", "Specific", myPath),
        ACAttclassesPane("attclasses", "Attribute Classes", myPath).attclasses(entity.attclasses).actions(["view", "remove"]),
        ACObjclassesPane("objclasses", "Object Classes", myPath).objclasses(entity.objclasses).actions(["view", "remove"]),
        ACVersionsPane("versions", "Versions", myPath)
          .versions(this.app.database.find("themes", ["id":reqParameters["id"]])),
        ACHistoryPane("history", "History", myPath)
      );
 *
 /      if ("pane" in reqParameters) tabpanes.active(reqParameters["pane"]); else tabpanes.panes[0].active = true;

      return 
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            BS5Row(["row-cards"],
                //CMSThemeForm("update", myPath).panes(tabpanes).entity(entity).toH5(reqParameters)

//                editTheme("/themes", entity, tabpanes, reqParameters)
            )
          )
        );

    }
  }*/ 