module uim.apps.views.components.null_;

@safe:
import uim.apps;

class DNullComponent : DViewComponent {
  mixin(ViewComponentThis!("NullComponent"));
  
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize(); 

    this
    .isNull(true) 
    .notNull(false); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
      return null;        
  }

  override string render(STRINGAA options = null) {
    return null; 
  }
}
mixin(ViewComponentCalls!("NullComponent"));

version(test_uim_apps) { unittest {
  assert(NullComponent);
}}