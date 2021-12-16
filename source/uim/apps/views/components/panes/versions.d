module uim.apps.views.components.panes.versions;

@safe:
import uim.apps;

auto versionsPane(T:DOOPEntity)(T entity, STRINGAA Parameters) {
        T[] entities;
        /* foreach(item; repository.find(entity.id)) {
            entities ~= new T(json);
        } */

        string rows;
        // foreach(item; entities) rows ~= row(item).toString; 

    return 
        BS5CardBody(
            H5Div(["card-title"], parameters.get("title", "Versions")),
            BS5Row( 
              BS5Col(["col-12"], 
            )
        )
    );
}

auto versionsPane(string pool, T:DOOPEntity)(T entity, STRINGAA Parameters) {
        T[] entities;
        foreach(item; repository.find(pool, ["id": entity.id.toString])) {
            entities ~= new T(json);
        }

        string rows;
        // foreach(item; entities) rows ~= row(item).toString; 

    return 
        BS5CardBody(
            H5Div(["card-title"], parameters.get("title", "Versions")),
            BS5Row( 
              BS5Col(["col-12"], 
            )
        )
    );
}

class DAPPPaneVersions : DAPPPane {
  this() { super(); this.title("Versions"); }
  this(DOOPEntity myEntity) { this(); this.entity(myEntity); }    
  this(DOOPEntity myEntity, DOOPEntity[] myVersions) { this(); this.entity(myEntity).versions(myVersions); }    

  mixin(SProperty!("DOOPEntity[]", "versions"));
  O versions(this O)(Json[] jsons) {
      _versions = jsons.map!(a => DOOPEntity(a)).array;
      return cast(O)this;
  }

  override void inner(STRINGAA options = null) {
    _col(
      APPTableVersions.versions(versions).toH5(options));
  }
}
auto APPPaneVersions() { return new DAPPPaneVersions; }
auto APPPaneVersions(DOOPEntity myEntity) { return APPPaneVersions.entity(myEntity); }
auto APPPaneVersions(DOOPEntity myEntity, DOOPEntity[] versions) { return APPPaneVersions(myEntity).versions(versions); }

auto APPPaneVersions(string myKey, string myTitle) { return APPPaneVersions.key(myKey).title(myTitle); }
auto APPPaneVersions(string myKey, string myTitle, string myPath) { return APPPaneVersions.key(myKey).title(myTitle).path(myPath); }
  