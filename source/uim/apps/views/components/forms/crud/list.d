module uim.apps.views.components.forms.crud.list;

@safe:
import uim.apps;

class DAPPEntitiesListForm : DEntitiesForm {
  mixin(ViewComponentThis!("APPEntitiesListForm", false, true));

  override void initialize() {
    super.initialize;

    this
      .header(
        FormHeader(this) //.mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["print", "export"]])
      )
      .content(
        EntitiesFormContent(this)      
      );
    /*       .form
        .header(APPEntitiesheader(this.form).rootPath("/cms/blogs").mainTitle("Blogs").subTitle("Blogs anzeigen").actions([["print", "export"]]))
        .body_(APPListbody_(this.form).rootPath("/cms/blogs"));
 */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("Form", ["card"], ["method":method, "action":action], 
        this.header.toH5(options)~
        this.content.toH5(options)~
        this.footer.toH5(options) 
      ));
    
    return [_col].toH5;
  }  
}
mixin(ViewComponentCalls!("APPEntitiesListForm", false, true));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPEntitiesListForm);
    assert(APPEntitiesListForm);
  }
}
