module uim.apps.views.components.forms.components.bodies.body_;

@safe:
import uim.apps;

class DAPPFormBody : DAPPFormComponent {
  mixin(APPFormComponentThis!("APPFormBody"));

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
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPFormBody);
    assert(APPFormBody);
    assert(APPFormBody.name == "APPFormBody");
    assert(new DAPPFormBody(APPForm));
    assert(APPFormBody(APPForm));
    assert(APPFormBody(APPForm).name == "APPFormBody");
    assert(APPFormBody(APPForm).form.name == "APPForm");
  }
}
