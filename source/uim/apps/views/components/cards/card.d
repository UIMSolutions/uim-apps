module uim.apps.views.components.cards.card;

@safe:
import uim.apps;

class DAPPCardViewComponent : DEntityViewComponent {
  mixin(ViewComponentThis!("APPCardViewComponent"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("APPCardViewComponent"));
