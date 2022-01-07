module uim.apps.views.components.forms.entities.list;

@safe:
import uim.apps;

class DAPPEntitiesListForm : DAPPForm, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesListForm", false, true));

  override void initialize() {
    super.initialize;

    this
    .formHeader(APPFormHeader(this).mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["refresh"], ["create"]]))
    .formBody(APPListFormBody(this));
  }

  mixin(OProperty!("DOOPEntity[]", "entities"));
  
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5");
    debug writeln(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5 -> Init.RootPath: ", this.rootPath);
    super.beforeH5(options);

    if (auto listView = cast(DAPPListView)this.view) {
      this.rootPath(listView.rootPath);
    }

    if (auto entitiesView = cast(IAPPWithEntities)this.view) {
      this.entities(entitiesView.entities);
    }
  }
}
mixin(APPViewComponentCalls!("APPEntitiesListForm", false, true));

version(test_uim_apps) {
  unittest {
    assert(new DAPPEntitiesListForm);
    assert(APPEntitiesListForm);
  }
}
