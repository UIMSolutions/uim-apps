module uim.apps.views.components.filter;

@safe:
import uim.apps;

DH5Obj filterName() {
  return 
    BS5InputGroup(["input-group-flat input-group-sm"], 
      BS5InputText("filterName", ["form-control-sm"], ["aria-label":"Filter display", "autocomplete":"off"]),
      H5Span(["input-group-text"], 
        H5A("btnClearFilterName", ["link-secondary"], ["href":"#"], tablerIcon("filter-off"))));
}

DH5Obj filterDisplay() {
  return 
    BS5InputGroup(["input-group-flat input-group-sm"], 
      BS5InputText("filterDisplay", ["form-control-sm"], ["aria-label":"Filter display", "autocomplete":"off"]),
      H5Span(["input-group-text"], 
        H5A("btnClearFilterDisplay", ["link-secondary"], ["href":"#"], tablerIcon("filter-off"))));
}
