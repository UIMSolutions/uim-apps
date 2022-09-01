module uim.apps.views.components.forms.components.contents.cards;

@safe:
import uim.apps;

class DAPPCardsFormContent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("APPCardsFormContent"));

  mixin(OProperty!("DViewComponent", "card"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPCardsFormContent~"::DAPPCardsFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormContent~"DEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] cards = entities.map!(entity => entity ? card.entity(entity).toH5 : null).join; 
      
    return [
      BS5Row(["row-cards"], cards)
    ].toH5;
  } 
}
mixin(ViewComponentCalls!("APPCardsFormContent"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPCardsFormContent);
    assert(APPCardsFormContent);
    assert(new DAPPCardsFormContent(Form));
    assert(APPCardsFormContent(Form));
  }
}