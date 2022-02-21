module uim.apps.views.components.forms.crud.list;

@safe:
import uim.apps;

class DAPPEntitiesListForm : DAPPForm, IAPPWithEntities {
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

  mixin(OProperty!("DOOPEntity[]", "entities"));
  
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5");
    debug writeln(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5 -> Init.RootPath: ", this.rootPath);
    super.beforeH5(options);

    if (auto entitiesView = cast(IAPPWithEntities)this.view) {
      this.entities(entitiesView.entities);
    }
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
    assert(new DAPPEntitiesListForm);
    assert(APPEntitiesListForm);
  }
}
