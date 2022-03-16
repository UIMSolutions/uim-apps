module uim.apps.views.components.tabpanes.specific;

@safe:
import uim.apps;

class DAPPSpecificPaneViewComponent : DAPPEntityTabpane {
  mixin(ViewComponentThis!("APPSpecificPaneViewComponent"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("APPSpecificPaneViewComponent"));

/* lass DAPPPaneSpecific : DAPPPane {
  this() { super(); this.title("Specific"); }
  this(DOOPEntity myEntity) { this(); this.entity(myEntity); }    
  
  override void inner(STRINGAA options = null) {    
    _col = BS5Col(["col-12"], 
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label pt-4"], "Created"),
        BS5Col(["col-2"])));    
  }
}
   */