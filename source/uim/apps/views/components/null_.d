module uim.apps.views.components.null_;

@safe:
import uim.apps;

class DNullComponent : DViewComponent {
  mixin(ViewComponentThis!("NullComponent"));
  
  override void initialize() {
    super.initialize(); 

    this
    .isNull(true) 
    .notNull(false); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
      return null;        
  }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // TODO test
  }} 

  override string render(STRINGAA options = null) {
    return null; 
  }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
      /// TODO
  }}
}
mixin(ViewComponentCalls!("NullComponent"));
