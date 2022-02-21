/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.panes.entities;

@safe:
import uim.apps;

class DAPPEntitiesPaneViewComponent : DAPPPaneViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesPaneViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
  bool hasEntities() {
    return (this.entities.length > 0); 
  }
}
mixin(APPViewComponentCalls!("APPEntitiesPaneViewComponent"));

