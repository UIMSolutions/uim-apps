module uim.apps.views.components.search;

@safe:
import uim.apps;

class DAPPSearchInList : DAPPViewComponent {
  this() { super(); }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
    
    _h5Content ~= 
      H5Div(["ms-auto text-muted"], 
        H5Div(["input-group input-group-sm input-group-flat"], 
          BS5InputText("inputSearch", ["autocomplete":"off", "placeholder":"Suche in "~options.get("entitiesName", "")]), 
          H5Div(["invalid-feedback"], "Der Suchtext ist ungültig. Keine Sonderzeichen verwenden."),
          H5Span(["input-group-text"],
            H5A("btnClearSearch", ["link-secondary"], 
              ["href":"#", "title":"", "data-bs-toggle":"tooltip", "data-bs-original-title":"Suche löschen"], tablerIcon("x", ["text-uim"]))
          )));
  }
}
auto APPSearchInList() { return new DAPPSearchInList; }