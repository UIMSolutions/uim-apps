module uim.apps.views.components.forms.crud.list;

@safe:
import uim.apps;

class DAPPEntitiesListForm : DAPPEntitiesForm {
  mixin(APPViewComponentThis!("APPEntitiesListForm", false, true));

  override void initialize() {
    super.initialize;

    this
    .header(APPFormHeader(this).mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["print", "export"]]))
    .body_(APPEntitiesFormBody(this));

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
      H5Form("entityForm", ["card"], ["method":method, "action":action], 
        (this.header ? this.header.toH5(options) : null)~
        (this.body_ ? this.body_.toH5(options) : null)~
        (this.footer ? this.footer.toH5(options) : null)
      ));
    
    return [_col].toH5;
  }  
}
mixin(APPViewComponentCalls!("APPEntitiesListForm", false, true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPEntitiesListForm);
    assert(APPEntitiesListForm);
  }
}
