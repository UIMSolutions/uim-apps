module uim.apps.views.components.tables.versions;

@safe:
import uim.apps;

class DAPPTableVersions : DAPPTable {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }    
  this(DOOPEntity myEntity, DOOPEntity[] myVersions) { this(); this.entity(myEntity).versions(myVersions); }    

  mixin(SProperty!("DOOPEntity[]", "versions"));
  O versions(this O)(Json[] jsons) {
      foreach(json; jsons) _versions ~= DOOPEntity(json);
      return cast(O)this; }

  mixin(SProperty!("string[]", "actions"));

  DH5Obj row(DOOPEntity entity, string[] rowActions = ["view", "delete"]) {
      auto link = "?entity_id="~entity.id.toString~"&number="~to!string(entity.versionNumber);

      auto buttons = H5Span(["d-none d-sm-inline"]);
      foreach(action; rowActions) {
         switch(action) {
          case "view":
            buttons(BS5ButtonLink(["text-white me-1"], ["style":"background-color:#35A6FF", "href":this.path~"/view"~link], 
                  tablerIcon("eye", ["text-white"]))); break;
          case "delete":
            buttons(BS5ButtonLink(["text-white"], ["style":"background-color:#35A6FF", "href":this.path~"/delete"~link], 
              tablerIcon("trash", ["text-white"]))); break;
              default: break;
        } 
      }

      return
        H5Tr
          .td(BS5InputDate(["form-control-flush"], ["readonly":"readonly"]).value(entity.versionOn))
          .td(BS5InputNumber(["form-control-flush"], ["readonly":"readonly"]).value(entity.versionNumber))
          .td(BS5InputText(["form-control-flush"], ["readonly":"readonly"]).value(entity.versionDescription))
          .td(H5Div(["btn-list"], buttons));
  }

  override void tableContent(STRINGAA options = null) {    
    auto rows = versions.map!(a => row(a)).array;

    _header =  H5Thead(
      H5Tr
        .th(["w-1"], "Version on")
        .th(["w-1"], "Major")
        .th(["w-1"], "Minor")
        .th("Beschreibung")
        .th(["text-end w-1"], "Actions")
      );

    _body = H5Tbody(rows);
  }
}
auto APPTableVersions() { return new DAPPTableVersions; }
auto APPTableVersions(DAPPView myView) { return new DAPPTableVersions(myView); }
//auto APPTableVersions(DOOPEntity myEntity) { return APPTableVersions.entity(myEntity); }
// auto APPTableVersions(DOOPEntity myEntity, DOOPEntity[] versions) { return APPTableVersions(myEntity).versions(versions); }
  