module uim.apps.views.components.forms.components.contents.content;

@safe:
import uim.apps;

class DAPPFormContent : DAPPFormComponent {
  mixin(APPFormComponentThis!("APPFormContent"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPFormContent~"::DAPPFormContent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);

    this
      .id("FormContent-%s".format(uniform(1, 1_000)));
  }

  DH5Obj bodyContent(STRINGAA options = null) {
    return 
      BS5Row();
  }
}
mixin(APPFormComponentCalls!("APPFormContent"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPFormContent);
    assert(APPFormContent);
    assert(APPFormContent.name == "APPFormContent");
    assert(new DAPPFormContent(APPForm));
    assert(APPFormContent(APPForm));
    assert(APPFormContent(APPForm).name == "APPFormContent");
    assert(APPFormContent(APPForm).form.name == "APPForm");
  }
}
