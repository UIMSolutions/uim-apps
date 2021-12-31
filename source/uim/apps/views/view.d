module uim.apps.views.view;

@safe:
import uim.apps;

enum LeftBreakpoints = "col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2";
enum RightBreakpoints = "col-12 col-lg-3 col-xl-2";
enum MiddleBreakpoints = "col-12 col-sm-6 col-md-8 col-lg-6 col-xl-8";

class DAPPView : IAPPEventDispatcher {
    this() { initialize; }
    this(DAPPPageController myController) { this().controller(myController); }
    
  // Initialization (= hook method)
  void initialize() {
    debugMethodCall(moduleName!DAPPView~"::DAPPView:initialize");   

    this
    .name("APPView") 
    .links(APPLinkContainer) 
    .metas(APPMetaContainer) 
    .scripts(APPScriptContainer) 
    .styles(APPStyleContainer); 
    }
    
    mixin(OProperty!("DOOPEntity[]", "entities"));

    mixin(OProperty!("DAPPPageController", "controller")); 
    mixin(OProperty!("IAPPEventManager", "eventManager")); 
    mixin(OProperty!("string", "name")); 

    // view components
    mixin(OProperty!("DAPPViewComponent", "messages")); 
    mixin(OProperty!("DAPPViewComponent", "pageHeader")); 
    mixin(OProperty!("DAPPViewComponent", "pageFooter")); 
    mixin(OProperty!("DAPPViewComponent", "pageSideLeft")); 
    mixin(OProperty!("DAPPViewComponent", "pageSideRight")); 
    mixin(OProperty!("DAPPViewComponent", "pageContent")); 

  // #region error handling
    mixin(OProperty!("string", "error"));

    bool hasError() { return (this.error.length > 0); } 
  // #endregion error

    protected DAPPLayout _layout;
    O layout(this O)(DAPPLayout newLayout) { 
        debugMethodCall(moduleName!DAPPView~":DAPPView::layout"); 
        _layout = newLayout;
        return cast(O)this; 
    }
    DAPPLayout layout() {
        if (_layout) return _layout;
        if (this.controller) { return this.controller.layout; }
        return null;
    }

    // Containers
    mixin(OProperty!("DAPPLinkContainer", "links"));
    mixin(OProperty!("DAPPMetaContainer", "metas"));
    mixin(OProperty!("DAPPScriptContainer", "scripts"));
    mixin(OProperty!("DAPPStyleContainer", "styles"));

    mixin(OProperty!("STRINGAA", "bindings"));

  // #region h5 content
    void beforeH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPView~":DAPPView::beforeH5"); 
      // init
      _error = null; // Delete last error
    }
    unittest {
      version(uim_apps) {
        // TODO
    }}

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPView~":DAPPView::toH5"); 
    beforeH5(options);

    return [
      H5Main(["content"],
          (pageHeader ? pageHeader.toH5(options) : null)~
          BS5Row(["mt-2 row-cards"], 
              BS5Container.fluid()
              .row("messages", ["section"], messages ? messages.toH5(options) : null)
              .row(["section"], 
                  BS5Col([LeftBreakpoints], pageSideLeft ? pageSideLeft.toH5(options) : null),
                  BS5Col([MiddleBreakpoints], pageContent ? pageContent.toH5(options) : null),
                  BS5Col([RightBreakpoints], pageSideRight ? pageSideRight.toH5(options) : null)))
          (pageFooter ? pageFooter.toH5(options) : null))].toH5;

/* H5Div(["wrapper"], 
        head~
        H5Div(["page-wrapper bg-white"],
          pHeader ? BS5Container.fluid()(pHeader.toH5(options)) : null,
          H5Div(["page-body"], H5Div(["container-fluid"], view.toH5(options)))
        ).toString
        // foot
      ).toString,
 */      

    }
  unittest {
    version(uim_apps) {
      // TODO test
      }} 
    // #endregion h5

  // #region render
    /// Renders view
    /// Render triggers helper callbacks, which are fired before and after the template are rendered.
    /// The helper callbacks are called: `beforeRender`, `afterRender`
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPView~":DAPPView::beforeRender"); 
    }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    string afterRender(string renderedContent, STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPView~":DAPPView::afterRender"); 

      foreach (key, value; bindings) {
          renderedContent = renderedContent.replace("{{"~key~"}}", value);
      }

      return renderedContent; 
    }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    string render(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPView~":DAPPView::render"); 

      // 1. prepare render
      beforeRender(options);
      if (hasError) { return null; }
      
      // render
      auto h5content = toH5(options).map!(h5 => h5.toString).join;

      if (this.layout) {
          debug writeln("View has layout -> ", this.layout.name);
      }
      else {
          debug writeln("View has no layout");
      }
      string renderedLayout  = this.layout ? this.layout.render(this.controller, h5content, options) 
                                      : h5content;

      // 4. final works like bindings {{x}}
      auto finalRender = afterRender(renderedLayout, options); 
      if (hasError) { return null; }

      return finalRender; }
    unittest {
      version(uim_html) {
        /// TODO
      }}
  // #endregion render 
}
mixin(APPViewCalls!("APPView"));
