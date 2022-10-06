module uim.apps.views.components.tables.filter;

@safe:
import uim.apps;

class DAPPEntitiesTableFilter : DAPPViewComponent {
  this() { super(); this.visibleEntities(10); }
  this(DAPPView myView) { this().view(myView); }

  mixin(OProperty!("size_t", "visibleEntities"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    return [
      H5Tr
        .th()
        .th()
        .th()
        .th("filterName")
        .th("filterDisplay")
        .th()];
  }
}
auto APPEntitiesTableFilter() { return new DAPPEntitiesTableFilter; }

version(test_uim_apps) { unittest {
  assert(APPEntitiesTableFilter);
}}