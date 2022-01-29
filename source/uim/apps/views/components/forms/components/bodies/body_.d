module uim.apps.views.components.forms.components.bodies.body_;

@safe:
import uim.apps;

class DAPPFormBody : DAPPFormComponent {
  mixin(APPFormComponentThis!("APPFormHeader"));

  override void initialize() {
    super.initialize;

    this
    .id("formbody-%s".format(uniform(1, 1_000)));
  }

  DH5Obj bodyContent(STRINGAA options = null) {
    return 
      BS5Row();
  }
}
mixin(APPFormComponentCalls!("APPFormBody"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPFormBody);
    assert(APPFormBody);
    assert(new DAPPFormBody(APPController));
    assert(APPFormBody(APPController));
  }
}
