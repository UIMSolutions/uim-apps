module uim.apps.views.components.tables.components.headers.entities;

@safe:
import uim.apps;

class DAPPEntitiesTableHeader : DAPPTableHeader, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesTableHeader"));

  override void initialize() {
    super.initialize;

    this.visibleEntities(10);
  }

  mixin(OProperty!("string", "mainTitle"));
  mixin(OProperty!("size_t", "visibleEntities"));
  
  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DOOPEntity[] newEntities) {
    _entities = newEntities;

    if (auto withEntities = cast(IAPPWithEntities)this.header) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.content) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.footer) {
      withEntities.entities(this.entities); 
    }
  }

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options);

    if (auto entitiesTable = cast(IAPPWithEntities)table) {
      this.entities = entitiesTable.entities;
    }
  }
  
  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }

    return [
      H5Div(["d-flex"],
      H5Div(["text-muted"], 
        H5String("Show"),
        H5Div(["mx-2 d-inline-block"],
          BS5InputText(["form-control-sm"], ["value":to!string(visibleEntities), "size":"3", "aria-label": mainTitle~" count"])), 
        H5String("entries")),
      H5Div(["ms-auto text-muted"], 
        H5String("Search:"),
        H5Div(["ms-2 d-inline-block"], 
          BS5InputText(["form-control-sm"], ["aria-label":"Search "~mainTitle.toLower]))))].toH5;
  }
}
mixin(ViewComponentCalls!("APPEntitiesTableHeader"));

