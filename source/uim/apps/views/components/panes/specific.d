module uim.apps.views.components.panes.specific;

@safe:
import uim.apps;

class DAPPSpecificPaneViewComponent : DAPPEntityPaneViewComponent {
  mixin(APPViewComponentThis!("APPSpecificPaneViewComponent"));

  override void initialize() {
    super.initialize;
  }
}
mixin(APPViewComponentCalls!("APPSpecificPaneViewComponent"));

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