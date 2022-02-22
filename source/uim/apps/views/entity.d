module uim.apps.views.entity;

@safe:
import uim.apps;

class DAPPEntityView : DAPPView, IAPPWithEntity {
  mixin(APPViewThis!("APPEntityView"));

  // #region entity
    protected DOOPEntity _entity;
    bool hasEntity() {
      return _entity !is null;
    }  
    DOOPEntity entity() {
      return _entity;
    }  
    O entity(this O)(DOOPEntity newEntity) {
      _entity = newEntity;

      foreach(viewComponent; this.components) { 
        if (auto entityViewComponent = cast(DAPPEntityViewComponent)viewComponent) {
          entityViewComponent.entity(this.entity); 
        }
      }
      return cast(O)this;
    }
  // #endregion entity

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPView~":DAPPView::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln(hasEntity ? "has entity" : "no entity");
  }
}
mixin(APPViewCalls!("APPEntityView"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPEntityView);
    assert(APPEntityView); 
  }
}