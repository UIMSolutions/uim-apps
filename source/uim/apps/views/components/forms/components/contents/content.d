module uim.apps.views.components.forms.components.contents.content;

@safe:
import uim.apps;

class DFormContent : DFormComponent {
  mixin(FormComponentThis!("FormContent"));

  override void initialize() {
    debugMethodCall(moduleName!DFormContent~"::DFormContent("~this.name~"):initialize");   
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
mixin(FormComponentCalls!("FormContent"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DFormContent);
    assert(FormContent);
    assert(FormContent.name == "FormContent");
    assert(new DFormContent(Form));
    assert(FormContent(Form));
    assert(FormContent(Form).name == "FormContent");
    assert(FormContent(Form).form.name == "Form");
  }
}
