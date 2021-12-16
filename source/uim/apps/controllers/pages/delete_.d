module uim.apps.controllers.pages.delete_;
/**************************************************/
/* This package contains general delete_ page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPDeletePage : DAPPPage {
  this() { super(); 
    this
    .scripts(
      ["src":"/js/apps/entities/entity.js"], 
      ["src":"/js/apps/entities/delete.js"]); 
  }
  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts(
      ["src":"/js/apps/entities/"~entityName~"/entity.js"], 
      ["src":"/js/apps/entities/"~entityName~"/delete.js"]);
  }

    override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
        `
window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
    setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
    document.getElementById("entityForm").addEventListener("submit", event => {
      event.preventDefault();
      deleteEntity();
    })
  });`);
  else addToPageScript(reqParameters, 
        `window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
  setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
});`); 
  }
  unittest {
    version(uim_cms) {
      /// TODO
    }}

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCreatePage~":DAPPDeletePage::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) {
      // debug writeln("Redirect to "~options["redirect"]);
      return;
    }

    string appSessionId = options.get("appSessionId", "");
    auto appSession = getAppSession(options);
    if (!appSession) {
      options["redirect"] = "/";
      return; }

    if (!appSession.isValid(["session", "site"], options)) {
      options["redirect"] = "/";
      return; }

    auto entity = database[appSession.site.name, collectionName].findOne(options.toEntitySelect);
    if (!entity) {
      // TODO Errorhandling
      return;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);

    if (pageHeader) (cast(DAPPPageHeader)pageHeader).entity(entity);
    // if (panes) panes.entity(entity);
    if (form) form.entity(entity);
  }
  unittest {
    version(uim_cms) {
      /// TODO
    }}
}

/*

auto myJsPath = "";

class DAPPDeletePage(T:DOOPEntity) : DAPPPage {
  this() { super(); 
      this
      .title("ADMIN!CMS - Pages - Delete")
      .scripts(        
        ["src":"/js/apps/cms/app.js"],
      ["src":"/js/apps/"~myJsPath~"/entity.js"],
        ["src":"/js/apps/"~myJsPath~"/delete.js"])       
      .scripts(
        `let editor_text; let editor_summary;`~
        `
        ClassicEditor 
          .create( document.querySelector( '#entity_summary' ) )
          .then( newEditor => { editor_summary = newEditor; editor_summary.isReadOnly = true; } )
          .catch( error => { console.error( error ); } );
        ClassicEditor
          .create( document.querySelector( '#entity_text' ) )
          .then( newEditor => { editor_text = newEditor; editor_text.isReadOnly = true; } )
          .catch( error => { console.error( error ); } );
        `);
      }

    override DH5Obj[] toH5(STRINGAA reqParameters) { 
      // debug writeln(StyledString("In "~_request.path~"-DAPPDeletePage:toJson...").setForeground(AnsiColor.green).setBackground(AnsiColor.white));

      // debug writeln("Looking for entity in ->", siteName~"."~"myPool");
      auto json = this.app.database.findOne("siteName", "myPool", urlToSelect(reqParameters));
      auto entity = new T(json);


      auto tabpanes = APPPanes(entity);
      tabpanes.panes([
        APPPaneGeneral(entity),
        APPPaneVersions(entity),
        APPPaneHistory(entity)
      ]);

/*       .panes(
        ACGeneralPane("general", "General", "/themes"),
        ACTabpane("specific", "Specific", myPath),
        ACAttclassesPane("attclasses", "Attribute Classes", myPath).attclasses(entity.attclasses).actions(["view"]),
        ACObjclassesPane("objclasses", "Object Classes", myPath).objclasses(entity.objclasses).actions(["view"]),
        ACVersionsPane("versions", "Versions", myPath)
          .versions(this.app.database.find("themes", ["id":reqParameters["id"]])),
        ACHistoryPane("history", "History", myPath)
      );
 *      
        if ("pane" in reqParameters) tabpanes.active(reqParameters["pane"]); else tabpanes.panes[0].active = true;

      return 
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            deletePageHeader("/cms/themes", "Themes", "Delete Page", entity.id.toString),
            BS5Row(["row-cards"],
                // CMSThemeForm("delete", myPath).panes(tabpanes).entity(entity).toH5(reqParameters)
  
//                deleteTheme("/themes", entity, tabpanes, reqParameters)
            )
          )
        );

    }
}


*/