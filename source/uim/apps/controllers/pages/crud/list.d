module uim.apps.controllers.pages.crud.list;
/**************************************************/
/* This package contains general list page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPListPage : DAPPEntitiesPageController {
  mixin(APPPageControllerThis!("APPListPage"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .columns(H5Tr
      .th(["w-1"], `<input id="cbSelectAllEntities" class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select all">`)
      .th("headCreated", ["w-1"], H5String("Erstellt "))
      .th("headChanged", ["w-1"], H5String("Geändert "))
      .th("headName", ["w-1"], ["style":"min-width:100px;"], H5String("Name "), H5Span("nameSort", [""], tablerIcon("arrow-sort")), H5Span("nameUp", ["d-none"], tablerIcon("arrow-up")), H5Span("nameDown", ["d-none"], tablerIcon("arrow-down")))
      .th("headDisplay", [""], H5Span("Titel "), H5Span("displaySort", [""], tablerIcon("arrow-sort")), H5Span("displayUp", ["d-none"], tablerIcon("arrow-up")), H5Span("displayDown", ["d-none"], tablerIcon("arrow-down"))))
    .filters(H5Tr
        .th()
        .th()
        .th()
        .th(filterName)
        .th(filterDisplay))
    .scripts
      .addLinks(
        "/js/apps/entities/entity.js",  
        "/js/apps/entities/entities.js", 
        "/js/apps/entities/list.js");
  }

  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js", 
      "/js/apps/entities/"~entityName~"/entities.js", 
      "/js/apps/entities/"~entityName~"/list.js");
  }

  mixin(OProperty!("DH5Obj", "columns"));
  mixin(OProperty!("DH5Obj", "filters"));
}

/*

@safe:
import uim.apps;

auto myJsPath = "";

class DAPPListPage : DAPPPage {
  this() { super(); 
    this
    .title("ADMIN!CMS - Themes")
    .scripts(
      "/js/apps/cms/app.js"],
      "/js/apps/"~myJsPath~"/entity.js"],
      "/js/apps/"~myJsPath~"/list.js"]);
  }

  override DH5Obj[] toH5(STRINGAA reqParameters) { 

    auto result = super.toH5(reqParameters);
    if (result == "Error") return result;

  /* reqParameters.addScript(

    `window.addEventListener("load", event => `~
      jsBlock("listEntities('"~sessionId~"');")
    ~`)`); * /

    
*/