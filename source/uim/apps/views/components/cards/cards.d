module uim.apps.views.components.cards.cards;

@safe:
import uim.apps;

class DAPPCardsViewComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPCardsViewComponent"));

  mixin(OProperty!("DH5Obj[]", "cards"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    return [
      BS5Row(["row-cards"], this.cards)].toH5;
  }
}
mixin(APPViewComponentCalls!("APPCardsViewComponent"));
