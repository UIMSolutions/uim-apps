module uim.apps.views.components.forms.entities.entity;

@safe:
import uim.apps;

class DAPPEntityForm : DAPPForm, IAPPWithEntity {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }

  override void initialize() {
    super.initialize;
    this
    .name("APPEntityForm")
    .formBody(APPEntityFormBody(this));
  }

  mixin(OProperty!("DOOPEntity", "entity"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityForm~"::DAPPEntityForm:beforeH5"); 
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    if (auto entityView = cast(IAPPWithEntity)this.view) {
      this.entity(entityView.entity);
    }
  }
}
auto APPEntityForm() { return new DAPPEntityForm; }
auto APPEntityForm(DAPPView myView) { return new DAPPEntityForm(myView); }
