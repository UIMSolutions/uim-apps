module uim.apps.views.components.component;

@safe:
import uim.apps;

class DAPPViewComponent : DH5AppViewComponent {
  this() { super(); this.changed(true).dynamic(true); }
  this(DAPPView myView) { this(); this.view(myView); }
  
  mixin(OProperty!("bool", "dynamic")); 
  mixin(OProperty!("string", "jsCode")); 
  mixin(OProperty!("STRINGAA", "style")); 
  mixin(OProperty!("bool", "changed")); 
  mixin(OProperty!("DAPPViewComponent", "owner")); 
}
auto APPViewComponent() { return new DAPPViewComponent; }
auto APPViewComponent(DAPPView myView) { return new DAPPViewComponent(myView); }
