module uim.apps.views.components.component;

@safe:
import uim.apps;

class DAPPViewComponent : DAPPObject {
  this() { super(); this.name("APPViewComponent"); }  
  this(DAPPView myView) { this(); this.view(myView); }
  
  mixin(OProperty!("bool", "dynamic")); 
  mixin(OProperty!("bool", "isNull")); 
  mixin(OProperty!("STRINGAA", "style")); 
  mixin(OProperty!("bool", "changed")); 
  mixin(OProperty!("DAPPViewComponent", "owner")); 
  mixin(OProperty!("DAPPView", "view")); 
  mixin(OProperty!("DAPPLayout", "layout")); 
  mixin(APPParameter!("jsCode")); 
  mixin(APPParameter!("debugPrefix")); 

  // view components
  mixin(OProperty!("DAPPViewComponent[string]", "components")); 
  bool hasComponent(string key) {
    return (components.get(key, null) !is null);
  }
  DAPPViewComponent component(string key) {
    return components.get(key, null);
  }
  O component(this O)(string key, DAPPViewComponent newComponent) {
    components[key] = newComponent;
    return cast(O)this;
  }

  override void initialize() {
    super.initialize; 

    this
    .changed(true)
    .dynamic(true); 
  }
/* 
  DAPPViewComponent copy() {
    return
      clone
        .debugPrefix(this.debugPrefix) 
        .parameters(this.parameters)
        .dynamic(this.dynamic)
        .jsCode(this.jsCode)
        .style(this.style)
        .changed(this.changed)
        .owner(this.owner)
        .view(this.view)
        .layout(this.layout); 
  } */

  // #region h5 content 
    void beforeH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPViewComponent~":DAPPViewComponent("~this.name~")::beforeH5");
      // init
      this.clearError; // Delete last error
    }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO
    }}

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPViewComponent~":DAPPViewComponent("~this.name~")::toH5");
    beforeH5(options);
    DH5Obj[] preh5 = null;
    auto h5 = afterH5(preh5, options);
    return h5;        
  }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // TODO test
      }} 
    // #endregion h5

  DH5Obj[] afterH5(DH5Obj[] h5, STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPViewComponent~":DAPPViewComponent("~this.name~")::afterH5");
      return h5; // No changes 
    }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO
    }}
  // #region render
    /// Renders view
    /// Render triggers helper callbacks, which are fired before and after the template are rendered.
    /// The helper callbacks are called: `beforeRender`, `afterRender`
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"beforeRender"); 
    }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add Test
        }}

    string afterRender(string content, STRINGAA options = null) {
      debugMethodCall(debugPrefix~"afterRender"); 
      return content; // No changes
    }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add Test
        }}

    string renderH5(STRINGAA options = null) {
      auto preRender = toH5(options).map!(a => a.toString).join;
      return preRender;
      // return layout ? layout.render(controller, preRender) : preRender;
    }

    string render(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"render"); 
      beforeRender(options);
      if (hasError) { return null; }
      
      auto preRender = renderH5(options);
      if (hasError) { return null; }

      auto result = afterRender(preRender, options);
      if (hasError) { return null; }

      return result; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        /// TODO
      }}
    // #endregion render 
}
mixin(APPViewComponentCalls!("APPViewComponent"));
