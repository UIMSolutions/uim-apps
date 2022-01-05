module uim.apps.views.components.component;

@safe:
import uim.apps;

class DAPPViewComponent {
  this() { initialize; }  
  this(DAPPView myView) { this(); this.view(myView); }

  void initialize() {
    this
    .debugPrefix(moduleName!DAPPViewComponent~":DAPPViewComponent::")
    .changed(true)
    .dynamic(true); 
  }
  
  mixin(OProperty!("string", "debugPrefix")); 
  mixin(OProperty!("string", "name")); 
  mixin(OProperty!("bool", "dynamic")); 
  mixin(OProperty!("string", "jsCode")); 
  mixin(OProperty!("STRINGAA", "style")); 
  mixin(OProperty!("bool", "changed")); 
  mixin(OProperty!("DAPPViewComponent", "owner")); 
  mixin(OProperty!("DAPPView", "view")); 
  mixin(OProperty!("DAPPLayout", "layout")); 

  // Entity data
  mixin(OProperty!("DOOPEntity[]", "entities"));

  DAPPViewComponent clone() {
    return 
      APPViewComponent;
  }

  DAPPViewComponent copy() {
    return
      APPViewComponent
        .debugPrefix(this.debugPrefix) 
        .name(this.name)
        .dynamic(this.dynamic)
        .jsCode(this.jsCode)
        .style(this.style)
        .changed(this.changed)
        .owner(this.owner)
        .view(this.view)
        .layout(this.layout); 
  }

  // #region error handling
    mixin(OProperty!("string", "error"));

    bool hasError() { return (this.error.length > 0); } 
  // #endregion error


  string opIndex(string name) {
    switch (name) {
      case "ownerName": return owner ? owner.name : null; 
      case "viewName": return view ? view.name : null; 
      case "layoutName" : return layout ? layout.name : null; 

      default: return null;
    }
  }

  void opIndexAssign(string value, string name) {
    switch (name) {
      case "name": this.name(value); break; 
      default: break;
    }
  }

  // #region h5 content 
    void beforeH5(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"beforeH5"); 
      // init
      _error = null; // Delete last error
    }
    unittest {
      version(test_uim_apps) {
        // TODO
    }}

  DH5Obj[] toH5(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"toH5"); 
      beforeH5(options);
      DH5Obj[] preh5 = null;
      auto h5 = afterH5(preh5, options);
      return h5;        
    }
    unittest {
      version(test_uim_apps) {
        // TODO test
        }} 
      // #endregion h5

  DH5Obj[] afterH5(DH5Obj[] h5, STRINGAA options = null) {
      debugMethodCall(debugPrefix~"beforeH5"); 
      return h5; // No changes 
    }
    unittest {
      version(test_uim_apps) {
        // TODO
    }}
  // #region render
    /// Renders view
    /// Render triggers helper callbacks, which are fired before and after the template are rendered.
    /// The helper callbacks are called: `beforeRender`, `afterRender`
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"beforeRender"); 
    }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    string afterRender(string content, STRINGAA options = null) {
      debugMethodCall(debugPrefix~"afterRender"); 
      return content; // No changes
    }
    unittest {
      version(uim_html) {
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
    unittest {
      version(uim_html) {
        /// TODO
      }}
    // #endregion render 
}
auto APPViewComponent() { return new DAPPViewComponent; }
auto APPViewComponent(DAPPView myView) { return new DAPPViewComponent(myView); }
