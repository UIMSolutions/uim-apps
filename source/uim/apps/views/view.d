/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.view;

@safe:
import uim.apps;

class DAPPView : DAPPViewObject, IAPPEventDispatcher {
  mixin(APPViewThis!("APPView"));
    
  // Initialization (= hook method)
  override void initialize() {
    debugMethodCall(moduleName!DAPPView~"::DAPPView("~this.name~"):initialize");   
    super.initialize;

    this
      .name("APPView") 
      .links(APPLinkContainer) 
      .metas(APPMetaContainer) 
      .scripts(APPScriptContainer) 
      .styles(APPStyleContainer)
      .leftClasses(["d-none", "d-md-block", "col-12", "col-sm-6", "col-md-4", "col-lg-3", "col-xl-2"])
      .mainClasses(["col-12", "col-md-8", "col-lg-6", "col-xl-8"]) 
      .rightClasses(["d-none", "d-lg-block", "col-12", "col-sm-6", "col-md-4", "col-lg-3", "col-xl-2"]);
  }

  mixin(OProperty!("DAPPPageController", "controller")); 
  mixin(OProperty!("IAPPEventManager", "eventManager")); 
  mixin(OProperty!("string[]", "leftClasses")); 
  mixin(OProperty!("string[]", "mainClasses")); 
  mixin(OProperty!("string[]", "rightClasses")); 
    
  mixin(APPViewProperty!("DViewComponent", "messages")); 
  mixin(APPViewProperty!("DAPPPageHeader", "header")); 
  mixin(APPViewProperty!("DAPPPageFooter", "footer")); 
  mixin(APPViewProperty!("DViewComponent", "leftComponent")); 
  mixin(APPViewProperty!("DViewComponent", "mainComponent")); 
  mixin(APPViewProperty!("DViewComponent", "rightComponent")); 

  DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.controller && this.controller.database) { return this.controller.database; } // owner class has database
    return null; // no database found
  }

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
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO
    }}

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPView~":DAPPView::toH5"); 
    beforeH5(options);

    return [
      H5Main(["content"], ["style":"margin-bottom:200px"],
        (this.header ? this.header.toH5(options) : null)~
        BS5Row(["mt-2 row-cards"], 
          BS5Container.fluid()
          .row("messages", ["section"], this.messages ? this.messages.toH5(options) : null)
          .row(["section"], 
              BS5Col(this.leftClasses, this.leftComponent ? this.leftComponent.toH5(options) : null),
              BS5Col(this.mainClasses, this.mainComponent ? this.mainComponent.toH5(options) : null),
              BS5Col(this.rightClasses, this.rightComponent ? this.rightComponent.toH5(options) : null)))
        (this.footer ? this.footer.toH5(options) : null))].toH5;

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
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
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
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add Test
        }}

    string afterRender(string renderedContent, STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPView~":DAPPView::afterRender"); 

      foreach (key, value; bindings) {
          renderedContent = renderedContent.replace("{{"~key~"}}", value);
      }

      return renderedContent; 
    }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add Test
        }}

    string render(STRINGAA options = null) {
      debugMethodCall(moduleName!DAPPView~":DAPPView::render"); 

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
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        /// TODO
      }}
  // #endregion render 
}
mixin(APPViewCalls!("APPView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPView); 
}}
