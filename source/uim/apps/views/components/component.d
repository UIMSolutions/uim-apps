module uim.apps.views.components.component;

@safe:
import uim.apps;

class DAPPViewComponent : DAPPBaseView {
  mixin(ViewComponentThis!"APPViewComponent");
  
  
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize; 



/*     this
    .components.add(
      NullComponent.id("header"),
      NullComponent.id("content"),
      NullComponent.id("footer")
    ); */
  }
/* 
  DAPPViewComponent copy() {
    return
      clone
        .debugPrefix(this.debugPrefix) 
        .options(this.options)
        .dynamic(this.dynamic)
        .jsCode(this.jsCode)
        .style(this.style)
        .changed(this.changed)
        .view(this.view)
        .layout(this.layout); 
  } */

  // #region h5 content 
    override void beforeH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPViewComponent~":DAPPViewComponent("~this.name~")::beforeH5");
      this.clearError; // Delete last error
      super.beforeH5(options);
      // init
    }

    DH5Obj[] toH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPViewComponent~":DAPPViewComponent("~this.name~")::toH5");
      beforeH5(options);
      DH5Obj[] preh5 = null;
      auto h5 = afterH5(preh5, options);
      return h5;        
    }
  // #endregion h5

  DH5Obj[] afterH5(DH5Obj[] h5, STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPViewComponent~":DAPPViewComponent("~this.name~")::afterH5");
      return h5; // No changes 
    }

  // #region render
    /// Renders view
    /// Render triggers helper callbacks, which are fired before and after the template are rendered.
    /// The helper callbacks are called: `beforeRender`, `afterRender`
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"beforeRender"); 
    }


    string afterRender(string content, STRINGAA options = null) {
      debugMethodCall(debugPrefix~"afterRender"); 
      return content; // No changes
    }

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

    // #endregion render 
}
mixin(ViewComponentCalls!("APPViewComponent"));

version(test_uim_apps) { unittest {
  assert(APPViewComponent);
}}