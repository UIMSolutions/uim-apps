module uim.apps.views.components.cards.cards;

@safe:
import uim.apps;

class DAPPCardsViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPCardsViewComponent"));

  mixin(OProperty!("DH5Obj[]", "cards"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPCardsViewComponent~":DAPPCardsViewComponent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return [
      BS5Row(["row-cards"], ["data-masonry":"{&quot;percentPosition&quot;: true }"], this.cards)].toH5;
  }
}
mixin(ViewComponentCalls!("APPCardsViewComponent"));
