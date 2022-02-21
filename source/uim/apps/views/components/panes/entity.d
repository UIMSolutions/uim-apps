/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.panes.entity;

@safe:
import uim.apps;

class DAPPEntityPaneViewComponent : DAPPPaneViewComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityPaneViewComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
  bool hasEntity() {
    return (this.entity !is null); 
  }
}
mixin(APPViewComponentCalls!("APPEntityPaneViewComponent"));

