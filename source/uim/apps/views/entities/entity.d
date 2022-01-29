module uim.apps.views.entities.entity;

@safe:
import uim.apps;

class DAPPEntityView : DAPPView, IAPPWithEntity {
  mixin(APPViewThis!("APPEntityView"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityView~"::DAPPEntityView:initialize");   
    super.initialize;

    this
      .pageHeader(
        APPPageHeader(this).actions(["refresh", "list", "create"]))
      .form(
        APPEntityForm(this));
  }

  DOOPEntity _entity;
  @property DOOPEntity entity() { 
    return _entity; 
  }

  @property O entity(this O)(DOOPEntity newEntity) {
    _entity = newEntity;

    if (auto entityForm = cast(DAPPEntityForm)this.form) {
      debug writeln("Found entityView");
      entityForm.entity(this.entity);
    }

    return cast(O)this;
  }


  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("DAPPEntityForm", "form"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityView~"::DAPPEntityView:beforeH5");   
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityView~"::DAPPEntityView:toH5");    
    super.toH5(options);

    return [
      H5Div(["container-xl"],
        (pageHeader ? pageHeader.toH5(options) : null)~ 
        (messages ? BS5Row("messages", ["mb-2"]) : null)~
        BS5Row(["row-deck row-cards mb-2"], form.toH5(options))~
        (pageFooter ? pageFooter.toH5(options) : null)
      )].toH5;             
  }
}
mixin(APPViewCalls!("APPEntityView"));

unittest {
  version(test_uim_apps) {
    assert(new DAPPEntityView);
    assert(APPEntityView); 
    assert(APPEntityView.form(APPEntityForm).form);
    assert(APPEntityView.form(APPEntityForm).form.name == "APPEntityForm");
  }
}