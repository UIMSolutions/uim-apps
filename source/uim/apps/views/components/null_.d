module uim.apps.views.components.null_;

@safe:
import uim.apps;

class DAPPNullComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPNullComponent"));
  
  override void initialize() {
    super.initialize(); 

    this
    .isNull(true); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
      return null;        
  }
  version(test_uim_apps) {
    unittest {
      // TODO test
  }} 

  override string render(STRINGAA options = null) {
    return null; 
  }
  version(test_uim_apps) {
    unittest {
      /// TODO
  }}
}
mixin(APPViewComponentCalls!("APPNullComponent"));
