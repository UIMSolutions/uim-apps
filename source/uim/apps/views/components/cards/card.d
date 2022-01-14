module source.uim.apps.views.components.cards.card;

@safe:
import uim.apps;

class DAPPCardViewComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPCardViewComponent"));

  override void initialize() {
    super.initialize;
  }
}
mixin(APPViewComponentCalls!("APPCardViewComponent"));
