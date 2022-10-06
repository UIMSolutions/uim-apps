module uim.apps.views.components.cards.masonry;

@safe:
import uim.apps;

class DAPPMasonaryCardsComponent : DAPPViewComponent {
  mixin(ViewComponentThis!("APPMasonaryCardsComponent"));

  mixin(OProperty!("DH5Obj[]", "cards"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPMasonaryCardsComponent~":DAPPMasonaryCardsComponent("~this.name~")::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    debug writeln ("Masonary:", 
      BS5Row(["row-cards"], ["data-masonry":"{&quot;percentPosition&quot;: true }"], this.cards));
    return [
      BS5Row(["row-cards"], ["data-masonry":"{&quot;percentPosition&quot;: true }"], this.cards)].toH5;
  }
}
mixin(ViewComponentCalls!("APPMasonaryCardsComponent"));
