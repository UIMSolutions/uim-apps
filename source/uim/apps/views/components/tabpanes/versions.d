module uim.apps.views.components.tabpanes.versions;

@safe:
import uim.apps;

class DAPPVersionsPaneViewComponent : DAPPEntitiesTabpane {
  mixin(ViewComponentThis!("APPVersionsPaneViewComponent"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;
  }
}
mixin(ViewComponentCalls!("APPVersionsPaneViewComponent"));
/* 
auto versionsPane(T:DEntity)(T entity, STRINGAA Parameters) {
        T[] entities;
        /* foreach(item; repository.find(entity.id)) {
            entities ~= new T(json);
        } * /

        string rows;
        // foreach(item; entities) rows ~= row(item).toString; 

    return 
        BS5CardBody(
            H5Div(["card-title"], options.get("title", "Versions")),
            BS5Row( 
              BS5Col(["col-12"], 
            )
        )
    );
}

auto versionsPane(string pool, T:DEntity)(T entity, STRINGAA Parameters) {
        T[] entities;
        foreach(item; repository.find(pool, ["id": entity.id.toString])) {
            entities ~= new T(json);
        }

        string rows;
        // foreach(item; entities) rows ~= row(item).toString; 

    return 
        BS5CardBody(
            H5Div(["card-title"], options.get("title", "Versions")),
            BS5Row( 
              BS5Col(["col-12"], 
            )
        )
    );
}

class DAPPPaneVersions : DAPPPane {
  this() { super(); this.title("Versions"); }
  this(DEntity myEntity) { this(); this.entity(myEntity); }    
  this(DEntity myEntity, DEntity[] myVersions) { this(); this.entity(myEntity).versions(myVersions); }    

  mixin(OProperty!("DEntity[]", "versions"));
  O versions(this O)(Json[] jsons) {
      _versions = jsons.map!(a => DEntity(a)).array;
      return cast(O)this;
  }

  override void inner(STRINGAA options = null) {
    /*_col(
      /* APPTableVersions.versions(versions).toH5(options) );* /
  }
}
auto APPPaneVersions() { return new DAPPPaneVersions; }
auto APPPaneVersions(DEntity myEntity) { return APPPaneVersions.entity(myEntity); }
auto APPPaneVersions(DEntity myEntity, DEntity[] versions) { return APPPaneVersions(myEntity).versions(versions); }

auto APPPaneVersions(string myKey, string myTitle) { return APPPaneVersions.key(myKey).title(myTitle); }
auto APPPaneVersions(string myKey, string myTitle, string myPath) { return APPPaneVersions.key(myKey).title(myTitle).path(myPath); }
   */