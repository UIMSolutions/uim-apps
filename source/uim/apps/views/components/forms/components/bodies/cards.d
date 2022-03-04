module uim.apps.views.components.forms.components.bodies.cards;

@safe:
import uim.apps;

class DAPPCardsFormBody : DAPPEntitiesFormBody {
  mixin(APPFormComponentThis!("APPCardsFormBody"));

  mixin(OProperty!("DAPPEntityViewComponent", "card"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPCardsFormBody~"::DAPPCardsFormBody("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesFormBody~"DAPPEntitiesFormBody::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] cards = entities.map!(entity => entity ? card.entity(entity).toH5 : null).join; 
      
    return [
      BS5Row(["row-cards"], cards)
    ].toH5;
  } 
}
mixin(APPFormComponentCalls!("APPCardsFormBody"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPCardsFormBody);
    assert(APPCardsFormBody);
    assert(new DAPPCardsFormBody(APPForm));
    assert(APPCardsFormBody(APPForm));
  }
}