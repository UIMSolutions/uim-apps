module uim.apps.views.components.forms.entities.list;

@safe:
import uim.apps;

class DAPPEntitiesListForm : DAPPForm {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }

  override void initialize() {
    super.initialize;

    this
    .formHeader(APPFormHeader.mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["refresh"], ["create"]]))
    .formBody(APPListFormBody(this));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5");
    debug writeln(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5 -> Init.RootPath: ", this.rootPath);
    super.beforeH5(options);

    debug writeln(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5 -> RootPath: ", this.rootPath);
    if (auto listView = cast(DAPPListView)this.view) {
      this.rootPath(listView.rootPath);
    }

    debug writeln(moduleName!DAPPEntitiesListForm~":DAPPEntitiesListForm("~this.name~")::beforeH5 -> RootPath: ", this.rootPath);
    foreach(component; [formHeader, formBody, formFooter]) { 
      if (auto formComponent = cast(DAPPFormComponent)component) {
        formComponent
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .entities(this.entities);
      }
    }
  }
}
auto APPEntitiesListForm() { return new DAPPEntitiesListForm; }
auto APPEntitiesListForm(DAPPView myView) { return new DAPPEntitiesListForm(myView); }

version(uim_apps) {
  unittest {
    assert(new DAPPEntitiesListForm);
    assert(APPEntitiesListForm);
  }
}
